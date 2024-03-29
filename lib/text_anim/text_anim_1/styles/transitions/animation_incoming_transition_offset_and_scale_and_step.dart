import 'package:flutter/animation.dart';
import 'package:flutter_common_demo/text_anim/text_anim_1/styles/animation_settings.dart';
import 'package:flutter_common_demo/text_anim/text_anim_1/styles/animation_style.dart';

import '../../widget_animator.dart';

/// [AnimationIncomingTransitionOffsetAndScaleAndStep] demonstration of more transition animations where various elements are animated at different times
class AnimationIncomingTransitionOffsetAndScaleAndStep
    extends AnimationTransitionStyle {
  @override
  AnimationSettings getSettings(WidgetTransitionEffects effects,
      AnimationController animationController) {
    AnimationSettings _animationSettings =
        AnimationSettings(animationController: animationController);

    double delay = (effects.delay?.inMilliseconds ?? 0).toDouble();
    double duration = (effects.duration?.inMilliseconds ?? 300).toDouble();

    _animationSettings.opacityAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        if (delay > 0)
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 0)
                .chain(CurveTween(curve: Curves.linear)),
            weight: delay,
          ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: duration * 0.3,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1)
              .chain(CurveTween(curve: Curves.linear)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1)
              .chain(CurveTween(curve: Curves.linear)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1)
              .chain(CurveTween(curve: Curves.linear)),
          weight: duration * 0.2,
        ),
      ],
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    _animationSettings.offsetYAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        if (delay > 0)
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 0)
                .chain(CurveTween(curve: Curves.linear)),
            weight: delay,
          ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: -5)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: duration * 0.3,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -5, end: -5)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -5, end: -5)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: -5, end: 0)
              .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
          weight: duration * 0.2,
        ),
      ],
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    _animationSettings.scaleAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        if (delay > 0)
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: 0)
                .chain(CurveTween(curve: Curves.linear)),
            weight: delay,
          ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: duration * 0.3,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.2)
              .chain(CurveTween(curve: Curves.ease)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          weight: duration * 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1)
              .chain(CurveTween(curve: Curves.ease)),
          weight: duration * 0.2,
        ),
      ],
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    return _animationSettings;
  }
}
