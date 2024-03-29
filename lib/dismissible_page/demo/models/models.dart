import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/dismissible_page/lib/dismissible_page.dart';

class DismissiblePageModel {
  DismissiblePageModel() {
    stories = [
      StoryModel(title: 'Random', imageUrl: randomNature),
      StoryModel(title: 'Photos', imageUrl: randomNature),
      StoryModel(title: 'From', imageUrl: randomFood),
      StoryModel(title: 'Unsplash', imageUrl: randomNature),
    ];
  }

  String get randomFood =>
      'https://source.unsplash.com/collection/1424340/${Random().nextInt(20) + 400}x${Random().nextInt(20) + 600}';

  String get randomNature =>
      'https://source.unsplash.com/collection/1319040/${Random().nextInt(20) + 400}x${Random().nextInt(20) + 600}';

  List<StoryModel> stories = [];
  final contacts = {
    'GitHub': 'https://github.com/Tkko',
    'LinkedIn': 'https://www.linkedin.com/in/thornike/',
    'Medium': 'https://thornike.medium.com/',
    'Pub': 'https://pub.dev/publishers/fman.ge/packages',
  };

  Duration transitionDuration = const Duration(milliseconds: 250);
  Duration reverseTransitionDuration = const Duration(milliseconds: 250);
  bool isFullScreen = true;
  bool disabled = false;
  double startingOpacity = 1;
  double minScale = .85;
  double minRadius = 7;
  double maxRadius = 30;
  double maxTransformValue = .5;
  double dragSensitivity = .7;
  Color backgroundColor = Colors.black;
  DismissiblePageDismissDirection direction =
      DismissiblePageDismissDirection.vertical;
  Map<DismissiblePageDismissDirection, double> dismissThresholds =
      const <DismissiblePageDismissDirection, double>{};
  DragStartBehavior dragStartBehavior = DragStartBehavior.down;
  Duration reverseDuration = const Duration(milliseconds: 200);
  HitTestBehavior behavior = HitTestBehavior.opaque;
}

class StoryModel {
  final String altUrl = 'assets/images/photo_not_found.png';
  final storyId = UniqueKey();
  final String title;
  final String imageUrl;

  StoryModel({
    required this.title,
    required this.imageUrl,
  });
}
