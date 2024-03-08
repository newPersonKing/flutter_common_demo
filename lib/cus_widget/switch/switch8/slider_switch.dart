library slider_switch;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// An small and fully customizable toggleable slider switch for flutter.
/// It supports custom color, icon for the on and off states
class SliderSwitch extends StatefulWidget {
  /// The orientation of the slider switch its horizontal or vertical.
  /// Default value: Axis.vertical
  final Axis orientation;

  /// Adds a spring animation when the user let go the button switch.
  /// Default value: true
  final bool withSpring;

  /// initial status for the switch.
  /// Default value: false
  final bool initialStatus;

  /// Callback function called when the switch change state.
  ///
  final ValueChanged<bool>? onChanged;

  // dimensions
  /// Width in vertical orientation or height in horizontal orientation of the switch.
  /// Default value: 50.0
  final double width;

  /// Lenght in horizontal orientation or height in vertical orientation.
  /// Default value: 130.0
  final double lenght;

  // status colors
  /// Color used as background when the switch is in "On" state.
  /// Default value: Colors.green
  final Color statusOnColor;

  /// Color used as background when the switch is in "Off" state.
  /// Default value: Colors.grey
  final Color statusOffColor;

  /// Value of opacity for the background color.
  /// Default value: 0.5
  final double statusColorOpacity;

  // status icons
  /// Icon used when the switch is in "On" state.
  /// Default value: Icons.volume_up
  final IconData statusOnIcon;

  /// Icon used when the switch is in "Off" state.
  /// Default value: Icons.volume_off
  final IconData statusOffIcon;

  /// statusOnIconOffset used to fine position the status icon
  /// Default value: Offset(0.0,0.0)
  /// dx: positive values ofset the position to the right
  /// dy: positive values offset the position up
  final Offset statusOnIconOffset;

  /// statusOffIconOffset used to fine position the status icon
  /// Default value: Offset(0.0,0.0)
  /// dx: positive values ofset the position to the right
  /// dy: positive values offset the position up
  final Offset statusOffIconOffset;

  /// Is enabled the button.
  /// Default value: true
  final bool isEnabled;

  const SliderSwitch({
    Key? key,
    this.initialStatus = false,
    this.onChanged,
    this.orientation = Axis.vertical,
    this.withSpring = true,
    this.width = 50.0,
    this.lenght = 130.0,
    this.statusOnColor = Colors.green,
    this.statusOffColor = Colors.grey,
    this.statusOnIcon = Icons.volume_up,
    this.statusOffIcon = Icons.volume_off,
    this.statusOnIconOffset = const Offset(0.0, 0.0),
    this.statusOffIconOffset = const Offset(0.0, 0.0),
    this.statusColorOpacity = 0.5,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _SliderSwitchState createState() => _SliderSwitchState();
}

class _SliderSwitchState extends State<SliderSwitch>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;
  late bool _status;
  late double _startAnimationPosX;
  late double _startAnimationPosY;

  @override
  void initState() {
    super.initState();

    _status = widget.initialStatus;

    _controller =
        AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;
    _controller.addListener(() {});

    if (widget.orientation == Axis.horizontal) {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(2.5, 0.0))
          .animate(_controller);
    } else {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.0, 0.8))
          .animate(_controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: FittedBox(
        child: SizedBox(
          width: widget.orientation == Axis.horizontal
              ? widget.lenght
              : widget.width,
          height: widget.orientation == Axis.horizontal
              ? widget.width
              : widget.lenght,
          child: Material(
            type: MaterialType.canvas,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(50.0),
            color: _status
                ? widget.statusOnColor.withOpacity(widget.statusColorOpacity)
                : widget.statusOffColor.withOpacity(widget.statusColorOpacity),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  // Off Icon
                  left: widget.orientation == Axis.horizontal
                      ? widget.width / 4.0 + widget.statusOffIconOffset.dx
                      : widget.width / 4.0 + widget.statusOffIconOffset.dy,
                  bottom: widget.orientation == Axis.horizontal
                      ? (widget.width / 4.0 + widget.statusOffIconOffset.dy)
                  // ? null
                      : widget.width / 4.0 + widget.statusOffIconOffset.dx,
                  child: Icon(
                    widget.statusOffIcon,
                    size: widget.width / 2,
                    color: !_status && widget.isEnabled
                        ? Colors.black
                        : Colors.white.withOpacity(0.7),
                  ),
                ),
                Positioned(
                  // On Icon
                  right: widget.orientation == Axis.horizontal
                      ? widget.width / 4.0 - widget.statusOnIconOffset.dx
                      : widget.width / 4.0 - widget.statusOnIconOffset.dy,
                  top: widget.orientation == Axis.horizontal
                      ? widget.width / 4.0 - widget.statusOnIconOffset.dy
                      : widget.width / 4.0 - widget.statusOnIconOffset.dx,
                  child: Icon(
                    widget.statusOnIcon,
                    size: widget.width / 2,
                    color: _status && widget.isEnabled
                        ? Colors.black
                        : Colors.white.withOpacity(0.7),
                  ),
                ),
                GestureDetector(
                  onHorizontalDragStart: widget.isEnabled ? _onPanStart : null,
                  onHorizontalDragUpdate:
                  widget.isEnabled ? _onPanUpdate : null,
                  onHorizontalDragEnd: widget.isEnabled ? _onPanEnd : null,
                  child: SlideTransition(
                    position: _animation,
                    child: SizedBox(
                      width: widget.width - 10,
                      child: Material(
                        color: widget.isEnabled
                            ? Colors.white.withOpacity(0.6)
                            : Colors.white24,
                        shape: const CircleBorder(),
                        elevation: 5.0,
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  child: child, scale: animation);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Calculate the delta position of the button as is dragged
  double offsetFromGlobalPos(Offset globalPosition) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset local = box.globalToLocal(globalPosition);
    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    _startAnimationPosY = ((local.dy * 0.75) / box.size.height) - 0.4;
    if (widget.orientation == Axis.horizontal) {
      return ((local.dx * 0.75) / box.size.width) - 0.4;
    } else {
      return ((local.dy * 0.75) / box.size.height) - 0.4;
    }
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();
    bool isHor = widget.orientation == Axis.horizontal;
    bool changed = false;
    if (_controller.value <= -0.20) {
      // setState(() => isHor ? true : false);
      setState(() => _status = isHor ? false : true);
      changed = true;
    } else if (_controller.value >= 0.20) {
      // setState(() => isHor ? false : true);
      setState(() => _status = isHor ? true : false);
      changed = true;
    }
    if (widget.withSpring) {
      final SpringDescription _kDefaultSpring =
      SpringDescription.withDampingRatio(
        mass: 0.9,
        stiffness: 250.0,
        ratio: 0.6,
      );
      if (widget.orientation == Axis.horizontal) {
        _controller.animateWith(
            SpringSimulation(_kDefaultSpring, _startAnimationPosX, 0.0, 0.0));
      } else {
        _controller.animateWith(
            SpringSimulation(_kDefaultSpring, _startAnimationPosY, 0.0, 0.0));
      }
    } else {
      _controller.animateTo(0.0,
          curve: Curves.bounceOut, duration: const Duration(milliseconds: 500));
    }

    if (changed && widget.onChanged != null) {
      widget.onChanged!(_status);
    }
  }
}