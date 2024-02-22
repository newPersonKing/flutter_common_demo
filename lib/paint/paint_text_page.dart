

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaintTextPage extends StatefulWidget {
  const PaintTextPage({super.key});

  @override
  State<StatefulWidget> createState() => _PaintTextPageState();
}


class _PaintTextPageState extends State<PaintTextPage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.blue,
      child: Center(
        child: CustomPaint(
          size: const Size(double.infinity, 300),
          painter: _TextPainter(),
        ),
      ),
    );
  }

}

class _TextPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(fontSize: 24, height: 1.5, textHeightBehavior: const ui.TextHeightBehavior()),
    )
      ..addPlaceholder(100, 50, PlaceholderAlignment.top) // 增加空白
      ..pushStyle(ui.TextStyle(
          fontSize: 20,
          color: Colors.red,
      ))
      ..addText('Hello World')
      ..pushStyle(ui.TextStyle(
          fontSize: 20,
          color: Colors.black
      ))
      // ..pop() 移除最近的一次样式设置
      ..addText('第二段文本');
    ui.ParagraphConstraints paragraphConstraints = ui.ParagraphConstraints(width: size.width / 3 * 2);
    ui.Paragraph paragraph = paragraphBuilder.build()..layout(paragraphConstraints);
    canvas.drawParagraph(paragraph, Offset(size.width / 3 / 2, 100));

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return false;
  }

}