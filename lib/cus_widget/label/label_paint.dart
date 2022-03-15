


import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LabelPosition {
  LeftTop,
  LeftBottom,
  RightTop,
  RightBottom
}

class LabelPaint extends CustomPainter{

  var labelWidth = 50.0;
  var labelOffset = 10.0;
  String paintText;
  var pathPaint = Paint();
  TextStyle? textStyle ;
  LabelPosition? labelPosition;

  LabelPaint({required this.labelWidth,required this.labelOffset,required this.paintText,this.labelPosition,this.textStyle});


  @override
  void paint(Canvas canvas, Size size) {

    if(paintText.isEmpty) return;
    labelPosition??= LabelPosition.LeftTop;

    var path = Path();
    path
      ..moveTo(0, labelOffset)
      ..lineTo(0, labelOffset + labelWidth)
      ..lineTo(labelOffset + labelWidth, 0)
      ..lineTo(labelOffset, 0)
      ..close();

    pathPaint
      ..strokeWidth = 10
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    canvas.drawPath(_createLabelBoxPath(size), pathPaint);
    _drawTextPaintShowSize(canvas,size);
  }

  Path _createLabelBoxPath(Size size){
    var path = Path();
    if(labelPosition == LabelPosition.LeftTop){
      path
        ..moveTo(0, labelOffset)
        ..lineTo(0, labelOffset + labelWidth)
        ..lineTo(labelOffset + labelWidth, 0)
        ..lineTo(labelOffset, 0)
        ..close();
    }

    if(labelPosition == LabelPosition.LeftBottom){
      path
        ..moveTo(0, size.height - labelOffset)
        ..lineTo(0, size.height - (labelOffset + labelWidth))
        ..lineTo(labelOffset + labelWidth, size.height)
        ..lineTo(labelOffset, size.height)
        ..close();
    }

    if(labelPosition == LabelPosition.RightTop){
      path
        ..moveTo(size.width - labelOffset, 0)
        ..lineTo(size.width - (labelOffset + labelWidth), 0)
        ..lineTo(size.width, labelOffset + labelWidth)
        ..lineTo(size.width, labelOffset)
        ..close();
    }

    if(labelPosition == LabelPosition.RightBottom){
      path
        ..moveTo(size.width - labelOffset, size.height)
        ..lineTo(size.width - (labelOffset + labelWidth), size.height)
        ..lineTo(size.width, size.height - (labelOffset + labelWidth))
        ..lineTo(size.width, size.height - labelOffset)
        ..close();
    }

    return path;
  }

  void _drawTextPaintShowSize(Canvas canvas,Size canvasSize) {
    canvas.save();
    var transX = 0.0;
    var transY = 0.0;
    var rotate = 0.0;
    if(labelPosition == LabelPosition.LeftTop){
      transX = (labelOffset + labelWidth/2)/2;
      transY = (labelOffset + labelWidth/2)/2;
      rotate = -pi/4;
    }
    if(labelPosition == LabelPosition.LeftBottom){
      transX = (labelOffset + labelWidth/2)/2;
      transY = canvasSize.height - (labelOffset + labelWidth/2)/2;
      rotate = pi/4;
    }

    if(labelPosition == LabelPosition.RightTop){
      transX = canvasSize.width - (labelOffset + labelWidth/2)/2;
      transY = (labelOffset + labelWidth/2)/2;
      rotate = pi/4;
    }

    if(labelPosition == LabelPosition.RightBottom){
      transX = canvasSize.width - (labelOffset + labelWidth/2)/2;
      transY = canvasSize.height - (labelOffset + labelWidth/2)/2;
      rotate = -pi/4;
    }

    canvas.translate(transX, transY);
    canvas.rotate(rotate);

    var style = textStyle??const TextStyle(
        fontSize: 15,
        color: Colors.black);

    TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: paintText,
            style: style),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    textPainter.layout(); // 进行布局
    Size textSize = textPainter.size; // 尺寸必须在布局后获取
    textPainter.paint(canvas,Offset(-textSize.width/2, -textSize.height/2));
    canvas.restore();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return true;
  }

}