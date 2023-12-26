import 'package:flutter/material.dart';
import 'package:flutter_common_demo/text_anim/text_anim_1/styles/animation_settings.dart';
import 'package:flutter_common_demo/text_anim/text_anim_1/widget_animator.dart';

/// [AnimationAtRestStyle] base abstract class for all 'At Rest' animation settings to use
abstract class AnimationAtRestStyle {
  AnimationSettings getSettings(
      WidgetRestingEffects effects, AnimationController animationController);
}

/// [AnimationTransitionStyle] base abstract class for all transition animation settings to use
abstract class AnimationTransitionStyle {
  AnimationSettings getSettings(
      WidgetTransitionEffects effects, AnimationController animationController);
}
