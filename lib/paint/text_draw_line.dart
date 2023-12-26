

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDrawLinePage extends StatefulWidget {
  const TextDrawLinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TextDrawLinePageState();
  }

}

class _TextDrawLinePageState extends State<TextDrawLinePage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        alignment: Alignment.center,
        child: const ThroughTextLine(
          hPadding: 0,
          lineColor: Colors.red,
          lineHeight: 4,
          child: Text("13413131",style: TextStyle(
              fontSize: 20
          )),
        ),
      ),
    );
  }
}

class ThroughTextLine extends StatelessWidget{

  final Color lineColor;
  final double lineHeight;
  final Widget child;
  final double hPadding;

  const ThroughTextLine({required this.child,this.hPadding = 10,required this.lineColor,required this.lineHeight,super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: child,
      ),
      painter: DrawTextLinePaint(lineHeight,lineColor),
    );
  }
}

class DrawTextLinePaint extends CustomPainter {

  final Color lineColor;
  final double lineHeight;

  DrawTextLinePaint(this.lineHeight,this.lineColor);

  var drawPaint = Paint()
    ..color = Colors.red;
  @override
  void paint(Canvas canvas, Size size) {
    var rect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, size.height / 2 - lineHeight / 2, size.width, lineHeight),
      topLeft: Radius.circular(lineHeight/2),
      topRight: Radius.circular(lineHeight/2),
      bottomLeft: Radius.circular(lineHeight/2),
      bottomRight: Radius.circular(lineHeight/2),
    );
    canvas.drawRRect(rect, drawPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}