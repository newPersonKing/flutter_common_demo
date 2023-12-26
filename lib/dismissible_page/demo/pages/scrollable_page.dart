import 'package:flutter/material.dart';
import 'package:flutter_common_demo/dismissible_page/demo/models/models.dart';
import 'package:flutter_common_demo/dismissible_page/lib/dismissible_page.dart';

class ScrollablePage extends StatefulWidget {
  final StoryModel story;

  ScrollablePage(this.story);

  @override
  State<ScrollablePage> createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final child = SizedBox(
      width: size.width,
      height: size.height,
      child: Material(
        color: Colors.transparent,
        child: Hero(
          tag: widget.story.storyId,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.network(
              widget.story.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

    return DismissiblePage(
      child: child,
      isFullScreen: false,
      direction: DismissiblePageDismissDirection.multi,
      onDismissed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
