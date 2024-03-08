import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Duration _kSwitchAnimationDuration = Duration(milliseconds: 250);
class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.onChanged,
    required this.value,
    this.width = 70,
    this.height = 35,
    this.inactiveColor,
    this.activeColor,
    this.gradientActiveColor,
    this.gradientInActiveColor,
  }) : super(key: key);

  /// Function callback similar to [Switch.onChanged] or [CupertinoSwitch.onChanged].
  final ValueChanged<bool> onChanged;

  /// Referring to [Switch.value] or [CupertinoSwitch.value]
  final bool value;

  /// Referring to [Switch.inactiveColor] in the case of [SwitchType.material],
  /// we use inactiveColor for both [Switch.inactiveTrackColor]
  /// and [Switch.inactiveTrackColor] with [Color.withOpacity].
  final Color? inactiveColor;

  /// Color for background of the switch widget when [value] is true.
  final Color? activeColor;

  final List<Color>? gradientActiveColor;
  final List<Color>? gradientInActiveColor;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 35,
              width: 70,
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(height / 2),
                ),
                gradient: getGradientColor() != null ? LinearGradient(colors: getGradientColor()!):null,
                color: value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedAlign(
              curve: Curves.ease,
              duration: _kSwitchAnimationDuration,
              alignment: !value ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color>? getGradientColor(){
    if(gradientInActiveColor != null && gradientInActiveColor != null){
      return value ? gradientActiveColor!:gradientInActiveColor!;
    }
    return null;
  }
}