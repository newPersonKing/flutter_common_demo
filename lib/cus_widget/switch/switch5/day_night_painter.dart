library day_night_themed_switch;

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'day_night_colors.dart';

final _borderInnerShadowPaint = Paint()
  ..color = Colors.black.withOpacity(0.8)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

final _borderLightShadowPaint = Paint()
  ..color = Colors.white.withOpacity(0.8)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

final _borderDarkShadowPaint = Paint()
  ..color = Colors.black.withOpacity(0.5)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

final _sunPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = sunColor;

final _celestialLightShadowPaint = Paint()
  ..style = PaintingStyle.stroke
  ..color = Colors.white.withOpacity(0.8)
  ..strokeWidth = 20
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

final _celestialDarkShadowPaint = Paint()
  ..style = PaintingStyle.stroke
  ..color = Colors.black.withOpacity(0.4)
  ..strokeWidth = 20
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

final _moonPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = moonColor;

final _moonCraterPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = moonCrateColor;

final _craterShadowPaint = Paint()
  ..style = PaintingStyle.stroke
  ..color = Colors.black.withOpacity(0.15)
  ..strokeWidth = 5
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

final _ringPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = Colors.white.withOpacity(0.09);

final _starPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = starColor
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);

final _downCloudPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = cloudDownColor;

final _highCloudPaint = Paint()
  ..style = PaintingStyle.fill
  ..color = cloudHighColor;

final _cloudShadowPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10
  ..color = Colors.black.withOpacity(0.2)
  ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

const widgetAspectRatio = 58 / 23;

class DayNightPainter extends CustomPainter {
  final double state;

  DayNightPainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    final widgetRect = _getWidgetRect(size);
    final widgetRadius = widgetRect.height / 2;
    final markerMoveProgress = (widgetRect.width - widgetRadius * 2) * state;
    final markerCenter = Offset(
      widgetRect.left + widgetRadius + markerMoveProgress,
      widgetRect.top + widgetRadius,
    );

    _drawWidgetOutShadow(canvas, widgetRect);
    _drawSky(canvas);
    _drawStars(canvas, widgetRect);
    _drawMarkerRings(canvas, widgetRect, markerCenter);
    _drawClouds(canvas, widgetRect);
    _drawMarker(canvas, widgetRect, markerCenter);
    _drawWidgetInnerShadow(canvas, widgetRect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return state != (oldDelegate as DayNightPainter).state;
  }

  Rect _getWidgetRect(Size size) {
    final isLeftProp = size.width / size.height <= widgetAspectRatio;
    final width = isLeftProp ? size.width : size.height * widgetAspectRatio;
    final height = isLeftProp ? size.width / widgetAspectRatio : size.height;
    return Rect.fromLTWH(
      isLeftProp ? 0 : (size.width - width) / 2,
      isLeftProp ? (size.height - height) / 2 : 0,
      width,
      height,
    );
  }

  void _drawWidgetOutShadow(Canvas canvas, Rect widgetRect) {
    final radius = widgetRect.height / 2;
    final shadowSize = widgetRect.height / 20;

    _borderLightShadowPaint.strokeWidth = math.max(radius / 10, 1);

    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(
      widgetRect.shift(Offset(0, -shadowSize)),
      Radius.circular(radius),
    ));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        widgetRect,
        Radius.circular(radius),
      ).shift(const Offset(0, 3)),
      _borderDarkShadowPaint,
    );
    canvas.restore();

    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(
      widgetRect.shift(Offset(0, shadowSize)),
      Radius.circular(radius),
    ));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        widgetRect,
        Radius.circular(radius),
      ).shift(const Offset(0, 3)),
      _borderLightShadowPaint,
    );
    canvas.restore();

    // Clip widget shape
    canvas.clipRRect(RRect.fromRectAndRadius(
      widgetRect,
      Radius.circular(radius),
    ));
  }

  void _drawSky(Canvas canvas) {
    canvas.drawColor(
      _tweenColor(skyNightColor, skyDayColor, state),
      BlendMode.srcIn,
    );
  }

  void _drawStars(canvas, Rect widgetRect) {
    final x1 = widgetRect.left;
    final y1 = widgetRect.top;
    final w = widgetRect.width;
    final h = widgetRect.height;
    final p = widgetRect.height * (1 - state);

    _drawStar(canvas, Offset(x1 + w * 0.22, y1 + h * 0.2 - p), h * 0.06);
    _drawStar(canvas, Offset(x1 + w * 0.11, y1 + h * 0.36 - p), h * 0.025);
    _drawStar(canvas, Offset(x1 + w * 0.22, y1 + h * 0.48 - p), h * 0.025);
    _drawStar(canvas, Offset(x1 + w * 0.15, y1 + h * 0.73 - p), h * 0.016);
    _drawStar(canvas, Offset(x1 + w * 0.12, y1 + h * 0.8 - p), h * 0.016);
    _drawStar(canvas, Offset(x1 + w * 0.24, y1 + h * 0.85 - p), h * 0.02);
    _drawStar(canvas, Offset(x1 + w * 0.46, y1 + h * 0.3 - p), h * 0.02);
    _drawStar(canvas, Offset(x1 + w * 0.43, y1 + h * 0.54 - p), h * 0.016);
    _drawStar(canvas, Offset(x1 + w * 0.48, y1 + h * 0.78 - p), h * 0.04);
    _drawStar(canvas, Offset(x1 + w * 0.58, y1 + h * 0.34 - p), h * 0.06);
    _drawStar(canvas, Offset(x1 + w * 0.55, y1 + h * 0.6 - p), h * 0.025);
  }

  void _drawStar(Canvas canvas, Offset center, double radius) {
    final double starAngle = radius * 1.5;
    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..arcToPoint(
        Offset(center.dx + radius, center.dy),
        radius: Radius.circular(starAngle),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(center.dx, center.dy + radius),
        radius: Radius.circular(starAngle),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(center.dx - radius, center.dy),
        radius: Radius.circular(starAngle),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(center.dx, center.dy - radius),
        radius: Radius.circular(starAngle),
        clockwise: false,
      )
      ..close();
    canvas.drawPath(path, _starPaint);
  }

  void _drawMarkerRings(Canvas canvas, Rect widgetRect, Offset markerCenter) {
    final widgetRadius = widgetRect.height / 2;
    final ring1 = 1.8 + (1.4 - 1.8) * state;
    final ring2 = 2.5 + (2 - 2.5) * state;
    final ring3 = 3.1 + (2.6 - 3.1) * state;
    canvas
      ..drawCircle(markerCenter, widgetRadius * ring1, _ringPaint)
      ..drawCircle(markerCenter, widgetRadius * ring2, _ringPaint)
      ..drawCircle(markerCenter, widgetRadius * ring3, _ringPaint);
  }

  void _drawClouds(Canvas canvas, Rect widgetRect) {
    final x1 = widgetRect.left;
    final y1 = widgetRect.top;
    final w = widgetRect.width;
    final h = widgetRect.height;
    final p = widgetRect.height * state;

    final downCloudPath = Path()
      ..moveTo(x1 + (w * 0.05), y1 + h + p)
      ..arcToPoint(Offset(x1 + (w * 0.2), y1 + h * 0.8 + p),
          radius: Radius.circular(w / 10))
      ..arcToPoint(Offset(x1 + (w * 0.38), y1 + h * 0.67 + p),
          radius: Radius.circular(w / 6))
      ..arcToPoint(Offset(x1 + (w * 0.54), y1 + h * 0.63 + p),
          radius: Radius.circular(w / 8))
      ..arcToPoint(Offset(x1 + (w * 0.575), y1 + h * 0.605 + p),
          radius: Radius.circular(w / 15))
      ..arcToPoint(Offset(x1 + (w * 0.575), y1 + h * 0.605 + p),
          radius: Radius.circular(w / 10))
      ..arcToPoint(Offset(x1 + (w * 0.72), y1 + h * 0.45 + p),
          radius: Radius.circular(w / 7))
      ..arcToPoint(Offset(x1 + (w * 0.815), y1 + h * 0.38 + p),
          radius: Radius.circular(w / 10))
      ..arcToPoint(Offset(x1 + w, y1 + p), radius: Radius.circular(w / 7))
      ..lineTo(x1 + w, y1 + h + p)
      ..close();

    canvas.drawPath(downCloudPath, _cloudShadowPaint);
    canvas.drawPath(downCloudPath, _downCloudPaint);

    final highCloudPath = Path()
      ..moveTo(x1 + (w * 0.08), y1 + h + p)
      ..arcToPoint(Offset(x1 + (w * 0.2), y1 + h * 0.92 + p),
          radius: Radius.circular(w / 10))
      ..arcToPoint(Offset(x1 + (w * 0.38), y1 + h * 0.86 + p),
          radius: Radius.circular(w / 7))
      ..arcToPoint(Offset(x1 + (w * 0.56), y1 + h * 0.84 + p),
          radius: Radius.circular(w / 8))
      ..arcToPoint(Offset(x1 + (w * 0.64), y1 + h * 0.82 + p),
          radius: Radius.circular(w / 8))
      ..arcToPoint(Offset(x1 + (w * 0.77), y1 + h * 0.73 + p),
          radius: Radius.circular(w / 9))
      ..arcToPoint(Offset(x1 + (w * 0.84), y1 + h * 0.54 + p),
          radius: Radius.circular(w / 8))
      ..arcToPoint(Offset(x1 + w, y1 + h * 0.2 + p),
          radius: Radius.circular(w / 7))
      ..lineTo(x1 + w, y1 + h + p)
      ..close();

    canvas.drawPath(highCloudPath, _cloudShadowPaint);
    canvas.drawPath(highCloudPath, _highCloudPaint);
  }

  void _drawMarker(Canvas canvas, Rect widgetRect, Offset center) {
    final widgetPadding = widgetRect.height * 0.1;
    final widgetRadius = widgetRect.height / 2;
    final celestialRadius = widgetRadius - widgetPadding;

    canvas.save();

    // draw sun
    _drawSun(canvas, center, celestialRadius);

    // draw moon
    if (state > 0) {
      final moonCenter = Offset(
        center.dx + celestialRadius * 2 * (1 - state),
        center.dy,
      );
      _drawMoon(canvas, moonCenter, celestialRadius);
    }

    canvas.restore();
  }

  void _drawSun(Canvas canvas, Offset center, double radius) {
    _drawCelestial(
      canvas,
      center,
      radius,
          (path) => canvas.drawPath(path, _sunPaint),
    );
  }

  void _drawMoon(Canvas canvas, Offset center, double radius) {
    _craterShadowPaint.strokeWidth = math.max(radius / 20, 1);
    _drawCelestial(
      canvas,
      center,
      radius,
          (path) {
        canvas.drawPath(path, _moonPaint);

        _drawCrater(
          canvas,
          Rect.fromCircle(
            center: Offset(
              center.dx - (radius * 0.35),
              center.dy + (radius * 0.2),
            ),
            radius: radius * 2 / 6,
          ),
        );

        _drawCrater(
          canvas,
          Rect.fromCircle(
            center: Offset(center.dx, center.dy - (radius * 0.5)),
            radius: radius / 5,
          ),
        );

        _drawCrater(
          canvas,
          Rect.fromCircle(
            center: Offset(
              center.dx + (radius * 0.43),
              center.dy + (radius * 0.38),
            ),
            radius: radius / 5,
          ),
        );
      },
    );
  }

  void _drawCrater(Canvas canvas, Rect rect) {
    final crater = Path()
      ..addArc(
        rect,
        0,
        2 * math.pi,
      );
    canvas.save();
    canvas.clipPath(crater);
    canvas.drawPath(crater, _moonCraterPaint);
    canvas.drawPath(crater.shift(const Offset(2, 2)), _craterShadowPaint);
    canvas.restore();
  }

  void _drawCelestial(
      Canvas canvas,
      Offset center,
      double radius,
      void Function(Path) draw,
      ) {
    _celestialLightShadowPaint.strokeWidth = math.max(radius / 5, 1);
    _celestialDarkShadowPaint.strokeWidth = math.max(radius / 5, 1);

    final celestialPath = Path();
    celestialPath.addArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * math.pi,
    );

    // Clip sun borders
    canvas.clipPath(celestialPath);

    // Draw sun background
    draw(celestialPath);

    // Draw sun dark shadow
    final darkShadowPath = Path();
    darkShadowPath.addArc(
      Rect.fromCircle(center: center, radius: radius + 20),
      0,
      2 * math.pi,
    );
    canvas.drawPath(
      darkShadowPath.shift(const Offset(-15, -15)),
      _celestialDarkShadowPaint,
    );

    // Draw sun light shadow
    final lightShadowPath = Path();
    lightShadowPath.addArc(
      Rect.fromCircle(center: center, radius: radius + 7),
      0,
      2 * math.pi,
    );
    canvas.drawPath(
      lightShadowPath.shift(const Offset(3, 3)),
      _celestialLightShadowPaint,
    );
  }

  void _drawWidgetInnerShadow(Canvas canvas, Rect widgetRect) {
    final widgetRadius = widgetRect.height / 2;
    final path = Path()
      ..arcTo(
        Rect.fromCenter(
          center: Offset(
            widgetRect.left + widgetRadius,
            widgetRect.top + widgetRadius,
          ),
          width: widgetRect.height,
          height: widgetRect.height,
        ),
        math.pi / 2,
        math.pi,
        false,
      )
      ..arcTo(
        Rect.fromCenter(
          center: Offset(
            widgetRect.left + widgetRect.width - widgetRadius,
            widgetRect.top + widgetRadius,
          ),
          width: widgetRect.height,
          height: widgetRect.height,
        ),
        -math.pi / 2,
        math.pi,
        false,
      )
      ..close();

    _borderInnerShadowPaint.strokeWidth = math.max(widgetRadius / 10, 1);
    canvas.drawPath(path.shift(const Offset(0, 8)), _borderInnerShadowPaint);
  }

  Color _tweenColor(Color c1, Color c2, double value) {
    assert(value >= 0 && value <= 1);
    final red = _tweenColorChannel(c1.red, c2.red, value);
    final green = _tweenColorChannel(c1.green, c2.green, value);
    final blue = _tweenColorChannel(c1.blue, c2.blue, value);
    final opacity = _tweenColorChannel(c1.opacity, c2.opacity, value);
    return Color.fromRGBO(red, green, blue, opacity);
  }

  T _tweenColorChannel<T extends num>(T c1, T c2, double value) {
    double result = c2 + (c1 - c2) * value;
    if (c1 is int) return result.toInt() as T;
    return result as T;
  }
}