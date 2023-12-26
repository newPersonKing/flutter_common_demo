

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';
import 'package:flutter_common_demo/network/print.dart';

class DashBorderPage extends StatefulWidget {

  const DashBorderPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashBorderPageState();

}

class _DashBorderPageState extends State<DashBorderPage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Center(
        child: CustomPaint(
          child: Image.asset(Assets.imagesFlutter,width: 100,),
          painter: DashBorderPaint(),
        ),
      ),
    );
  }
}

class DashBorderPaint extends CustomPainter {

  DashBorderPaint();

  @override
  void paint(Canvas canvas, Size size) {
    const DashPainter().paint(canvas, Path()
      ..addRect(Rect.fromLTWH(0,0, size.width , size.height)), Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke //这个必须有 因为只有闭合的路径才能是fill
      ..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return false;
  }

}

class DashPainter {
  final double step;
  final double span;

  const DashPainter({this.step = 2, this.span = 2,});

  double get partLength => step + span;

  void paint(Canvas canvas, Path path, Paint paint) {
    final PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      final int count = pm.length ~/ partLength;
      for (int i = 0; i < count; i++) {
        canvas.drawPath(
            pm.extractPath(partLength * i, partLength * i + step), paint);
      }
      final double tail = pm.length % partLength;
      canvas.drawPath(pm.extractPath(pm.length-tail, pm.length), paint);
    }
  }
}
