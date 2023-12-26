import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';
import 'package:flutter_common_demo/hyper_effects/animated_effect.dart';
import 'package:flutter_common_demo/hyper_effects/effects/effects.dart';

class SpringAnimation extends StatefulWidget {
  const SpringAnimation({super.key});

  @override
  State<SpringAnimation> createState() => _SpringAnimationState();
}

class _SpringAnimationState extends State<SpringAnimation> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Image.asset(Assets.imagesPinBall256x, width: 150, height: 150)
              .translateY(selected ? 300 : 0)
              .animate(toggle: selected,
              curve: selected ? Curves.easeOutQuart : Curves.elasticOut,
              duration: Duration(milliseconds: selected ? 1000 : 450),
              onEnd: () {
                if (selected) {
                  setState(() {
                    selected = false;
                  });
                }
              }),
        ),
      ),
    );
  }
}
