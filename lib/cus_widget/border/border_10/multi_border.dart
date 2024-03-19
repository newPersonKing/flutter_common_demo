import 'package:flutter/material.dart';

import 'extensions.dart';

/// A decoration class for adding multiple borders to widgets.
class MultiBorderDecoration extends ShapeDecoration {
  /// Creates a border for each BorderSide supplied in [borderSides].
  MultiBorderDecoration({
    required this.borderSides,
    this.boxShape = BoxShape.rectangle,
    this.innerRadius = BorderRadius.zero,
    super.color,
    super.gradient,
    super.image,
    super.shadows,
  })  : assert(borderSides.isNotEmpty),
        assert(
        boxShape == BoxShape.rectangle || innerRadius == BorderRadius.zero,
        '[boxShape] set to BoxShape.circle does not require an [innerRadius]'),
        super(
        shape: (boxShape == BoxShape.rectangle)
            ? _compositeRRectBorder(borderSides, innerRadius)
            : _compositeCircleBorder(borderSides),
      );

  /// Creates a border for each Color supplied in [borderColors].
  ///
  /// Each border will be of equal width [width].
  factory MultiBorderDecoration.evenBorders({
    required List<Color> borderColors,
    BoxShape boxShape = BoxShape.rectangle,
    BorderRadius innerRadius = BorderRadius.zero,
    double width = 1.0,
    Color? color,
    Gradient? gradient,
    DecorationImage? image,
    List<BoxShadow>? shadows,
  }) {
    final borderSides = borderColors.fold(
      <BorderSide>[],
          (borderSides, borderColor) =>
      borderSides..add(BorderSide(color: borderColor, width: width)),
    );

    return MultiBorderDecoration(
      borderSides: borderSides,
      boxShape: boxShape,
      innerRadius: innerRadius,
      color: color,
      gradient: gradient,
      image: image,
      shadows: shadows,
    );
  }

  /// Describes the [color] and [width] of each border.
  final List<BorderSide> borderSides;

  /// [BoxShape.rectangle] or [BoxShape.circle]
  final BoxShape boxShape;

  /// The radius of the innermost border to be drawn.
  final BorderRadius innerRadius;

  static ShapeBorder _compositeRRectBorder(
      List<BorderSide> borderSides,
      BorderRadius innerRadius,
      ) {
    final shapeBorders = <ShapeBorder>[];
    double radiusIncrement = 0.0;

    for (int i = 0; i < borderSides.length; i++) {
      shapeBorders.add(
        RoundedRectangleBorder(
          side: borderSides[i],
          borderRadius: innerRadius.incrementNonZeroCorners(radiusIncrement),
        ),
      );
      if (i + 1 < borderSides.length) {
        final nextDiff = borderSides[i + 1].width - borderSides[i].width;
        radiusIncrement += borderSides[i].width + nextDiff;
      }
    }

    return shapeBorders.reduce((tot, next) => tot + next);
  }

  static ShapeBorder _compositeCircleBorder(List<BorderSide> borderSides) {
    return borderSides.sublist(1).fold(
      CircleBorder(side: borderSides[0], eccentricity: 1.0),
          (prevCircleBorder, borderSide) =>
      prevCircleBorder +
          CircleBorder(side: borderSide, eccentricity: 1.0),
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return shape.getInnerPath(rect, textDirection: textDirection);
  }
}