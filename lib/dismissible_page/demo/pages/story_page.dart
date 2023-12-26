import 'package:flutter/widgets.dart';
import 'package:flutter_common_demo/dismissible_page/demo/models/models.dart';
import 'package:flutter_common_demo/dismissible_page/demo/widgets/widgets.dart';

class StoryPage extends StatelessWidget {
  final StoryModel story;
  final VoidCallback nextGroup;
  final VoidCallback previousGroup;

  const StoryPage({
    required this.story,
    required this.nextGroup,
    required this.previousGroup,
  });

  @override
  Widget build(BuildContext context) {
    void _onTap(TapUpDetails details) async {
      final dx = details.globalPosition.dx;
      final width = MediaQuery.of(context).size.width;
      if (dx < width / 2) return previousGroup();
      return nextGroup();
    }

    return GestureDetector(
      onTapUp: _onTap,
      child: StoryImage(story, isFullScreen: true),
    );
  }
}
