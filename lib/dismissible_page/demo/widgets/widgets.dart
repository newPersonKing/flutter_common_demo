import 'package:flutter/material.dart';
import 'package:flutter_common_demo/dismissible_page/demo/models/models.dart';
import 'package:flutter_common_demo/dismissible_page/demo/pages/stories_wrapper.dart';
import 'package:flutter_common_demo/dismissible_page/lib/dismissible_page.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  final DismissiblePageModel pageModel;

  const StoryWidget({required this.story, required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransparentRoute(
          StoriesWrapper(
            parentIndex: pageModel.stories.indexOf(story),
            pageModel: pageModel,
          ),
          transitionDuration: pageModel.transitionDuration,
          reverseTransitionDuration: pageModel.reverseTransitionDuration,
        );
      },
      child: StoryImage(story),
    );
  }
}

class StoryImage extends StatefulWidget {
  final StoryModel story;
  final bool isFullScreen;

  StoryImage(this.story, {this.isFullScreen = false});

  @override
  _StoryImageState createState() => _StoryImageState();
}

class _StoryImageState extends State<StoryImage> {
  late String imageUrl;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.story.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.story.storyId,
      placeholderBuilder: (_, Size size, Widget child) => child,
      child: Material(
        color: Colors.transparent,
        child: Container(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(widget.isFullScreen ? 20 : 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.isFullScreen ? 0 : 8),
            color: Color.fromRGBO(237, 241, 248, 1),
            image: DecorationImage(
              onError: (_, __) {
                setState(() {
                  imageUrl = widget.story.altUrl;
                  hasError = true;
                });
              },
              fit: BoxFit.cover,
              image: hasError
                  ? AssetImage(widget.story.altUrl)
                  : NetworkImage(imageUrl) as ImageProvider,
            ),
          ),
          child: Text(
            widget.story.title,
          ),
        ),
      ),
    );
  }
}

class DurationSlider extends StatelessWidget {
  final String title;
  final Duration duration;
  final ValueChanged<Duration> onChanged;

  DurationSlider({
    required this.title,
    required this.duration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$title - ',
            ),
            Text(
              '${duration.inMilliseconds}ms',
            ),
          ],
        ),
        Slider(
          value: duration.inMilliseconds.toDouble(),
          min: 0,
          max: 1000,
          divisions: 20,
          label: duration.inMilliseconds.toString(),
          onChanged: (value) {
            onChanged.call(Duration(milliseconds: value.round()));
          },
        ),
      ],
    );
  }
}
