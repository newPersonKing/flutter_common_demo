import 'package:flutter/widgets.dart';

extension RadiusX on Radius {
  /// Adds [increment] to non-zero radii.
  Radius incrementNonZero(double increment) =>
      this == Radius.zero ? this : this + Radius.circular(increment);
}

extension BorderRadiusX on BorderRadius {
  /// Adds [increment] to [topLeft, topRight, bottomLeft, bottomRight]
  ///
  /// Only increments if the radius is not [Radius.zero]
  BorderRadius incrementNonZeroCorners(double increment) {
    return BorderRadius.only(
      topLeft: topLeft.incrementNonZero(increment),
      topRight: topRight.incrementNonZero(increment),
      bottomLeft: bottomLeft.incrementNonZero(increment),
      bottomRight: bottomRight.incrementNonZero(increment),
    );
  }
}