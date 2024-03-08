import 'package:flutter/material.dart';

import 'day_night_painter.dart';

class DayNightSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final FocusNode? focusNode;
  final Duration animationDuration;

  const DayNightSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.focusNode,
    this.animationDuration = const Duration(milliseconds: 400),
  });

  @override
  State<DayNightSwitch> createState() => DayNightSwitchState();
}

@visibleForTesting
class DayNightSwitchState extends State<DayNightSwitch>
    with TickerProviderStateMixin {
  late final AnimationController animation;
  bool _value = false;

  bool get value => _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    animation = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: _value ? 1.0 : 0.0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DayNightSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
      final target = _value ? 1.0 : 0.0;
      animation.value = target;
    }
  }

  @override
  Widget build(BuildContext context) {
    final switchAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        borderRadius: BorderRadius.circular(300),
        child: Focus(
          focusNode: widget.focusNode,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (animation.isAnimating) return;
                if (!_value) {
                  await animation.forward();
                } else {
                  await animation.reverse();
                }
                setState(() => _value = !value);
                widget.onChanged?.call(_value);
              },
              child: AspectRatio(
                aspectRatio: widgetAspectRatio,
                child: CustomPaint(
                  painter: DayNightPainter(switchAnimation.value),
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}