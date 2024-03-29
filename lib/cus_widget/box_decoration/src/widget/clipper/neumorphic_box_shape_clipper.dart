import 'package:flutter/widgets.dart';

import '../../neumorphic_box_shape.dart';

class NeumorphicBoxShapeClipper extends StatelessWidget {
  final NeumorphicBoxShape shape;
  final Widget? child;

  NeumorphicBoxShapeClipper({super.key, required this.shape, this.child});

  CustomClipper<Path>? _getClipper(NeumorphicBoxShape shape) {
    return shape.customShapePathProvider;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _getClipper(shape),
      child: child,
    );
  }
}
