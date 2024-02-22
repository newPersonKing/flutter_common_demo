

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';
import 'package:flutter_common_demo/network/print.dart';

import '../ext/text_painter_ext.dart';

class SegmentPage extends StatefulWidget {

  const SegmentPage({super.key});

  @override
  State<StatefulWidget> createState() => _SegmentPagePageState();

}

class _SegmentPagePageState extends State<SegmentPage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.black,
      child: Center(
        child: CustomPaint(
          size: const Size(300, 50),
          painter: SegmentPaint(
              percents: [0.2,0.3,0.3,0.2],
              showNums: [ "0" ,"5","15","30","100"],
              bottomTxt: ["优秀","优秀","优秀","优秀优秀优秀",],
              colors: [Colors.red,Colors.yellow,Colors.grey,Colors.blue],
              fontSize: 14,
              textColor: Colors.white,
              lineHeight: 20,
              bottomTextColor: Colors.black,
              bottomFontSize: 16,
              currentPercent: 0.3,
              triangleHeight: 10,
              triangleWidth: 15,
              triangleColor: Colors.green
          ),
        ),
      ),
    );
  }
}

class SegmentPaint extends CustomPainter {
  List<double> percents = [];
  List<String> showNums = [];
  List<Color> colors = [];
  List<String> bottomTxt = [];
  var drawPaint = Paint();
  var lineHeight = 10.0;
  var fontSize = 12.0;
  Color textColor;
  var bottomFontSize  = 12.0;
  Color bottomTextColor;
  double currentPercent;
  double triangleHeight = 10;
  double triangleWidth = 10;
  Color triangleColor;
  var trianglePaint = Paint();

  SegmentPaint({required this.percents,
    required this.showNums,
    required this.colors,
    required this.lineHeight,
    required this.fontSize,
    required this.textColor,
    required this.bottomTxt,
    required this.bottomTextColor,
    required this.bottomFontSize,
    required this.currentPercent,
    required this.triangleHeight,
    required this.triangleWidth,
    required this.triangleColor
  });
  @override
  void paint(Canvas canvas, Size size) {

    var width = size.width;
    var height = size.height;
    var startPercent = 0.0;
    var index = 0;
    for (var element in percents) {
      var startX = width * startPercent;
      drawPaint.color = colors[index];
      if(index == 0){
        canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(startX, (height - lineHeight)/2, width * element, lineHeight),topLeft: Radius.circular(lineHeight/2),bottomLeft: Radius.circular(lineHeight/2)), drawPaint);
      }else if(index == percents.length - 1){
        canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(startX, (height - lineHeight)/2, width * element, lineHeight),topRight: Radius.circular(lineHeight/2),bottomRight: Radius.circular(lineHeight/2)), drawPaint);
      }else {
        canvas.drawRect(Rect.fromLTWH(startX, (height - lineHeight)/2, width * element, lineHeight), drawPaint);
      }

      //绘制顶部文字
      final topTextPainter = TextPainterExt.getTextPainter(
        text: showNums[index],
        textStyle:  TextStyle(
            fontSize: fontSize
        ),
        maxLine: 100,
        maxWidth: width,
      );

      ui.ParagraphBuilder topParagraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(
            color: textColor,
            fontSize: fontSize
        ))
        ..addText(showNums[index]);
      ui.ParagraphConstraints topParagraphConstraints = ui.ParagraphConstraints(width: topTextPainter.width);
      ui.Paragraph paragraph = topParagraphBuilder.build() ..layout(topParagraphConstraints);
      var textWidth = topTextPainter.width;
      var textHeight = topTextPainter.height;
      canvas.drawParagraph(paragraph, Offset(startX - textWidth/2, (height - lineHeight)/2 - textHeight-5));


      //绘制底部文字
      final bottomTextPainter = TextPainterExt.getTextPainter(
        text: bottomTxt[index],
        textStyle:  TextStyle(
            fontSize: fontSize
        ),
        maxLine: 100,
        maxWidth: width,
      );

      ui.ParagraphBuilder bottomParagraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(
            color: textColor,
            fontSize: fontSize
        ))
        ..addText(bottomTxt[index]);
      ui.ParagraphConstraints bottomParagraphConstraints = ui.ParagraphConstraints(width: bottomTextPainter.width);
      ui.Paragraph bottomParagraph = bottomParagraphBuilder.build() ..layout(bottomParagraphConstraints);
      var bottomTextWidth = bottomTextPainter.width;
      var bottomStartX = startX + width * element / 2 - bottomTextWidth / 2;
      canvas.drawParagraph(bottomParagraph, Offset(bottomStartX, (height + lineHeight)/2+10));
      startPercent+=element;
      index++;
    }

    if(showNums.length > percents.length){
      final textPainter = TextPainterExt.getTextPainter(
        text: showNums.last,
        textStyle: TextStyle(
            fontSize: fontSize
        ),
        maxLine: 100,
        maxWidth: width,
      );

      ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
        ..pushStyle(ui.TextStyle(
            color: textColor,
            fontSize: fontSize
        ))
        ..addText(showNums.last);
      ui.ParagraphConstraints paragraphConstraints = ui.ParagraphConstraints(width: textPainter.width);
      ui.Paragraph paragraph = paragraphBuilder.build() ..layout(paragraphConstraints);
      var textWidth = textPainter.width;
      var textHeight = textPainter.height;
      canvas.drawParagraph(paragraph, Offset(width - textWidth/2, (height - lineHeight)/2 - textHeight-5));
    }

    //绘制倒三角
    var triangleBottomX = currentPercent * width;
    var triangleTopLeftX = triangleBottomX - triangleWidth / 2;
    var triangleTopRightX = triangleBottomX + triangleWidth / 2;
    var triangleBottomY = height / 2 - lineHeight / 2 - 5;
    var triangleTopY = triangleBottomY - triangleHeight;
    var trianglePath = Path();
    trianglePath.moveTo(triangleBottomX, triangleBottomY);
    trianglePath.lineTo(triangleTopLeftX, triangleTopY);
    trianglePath.lineTo(triangleTopRightX, triangleTopY);
    trianglePath.close();
    trianglePaint.color = triangleColor;
    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return false;
  }

}
