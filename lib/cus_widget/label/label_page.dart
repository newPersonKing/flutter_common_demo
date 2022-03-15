

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'label_paint.dart';

class LabelPage extends StatelessWidget {
  const LabelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            CustomPaint(
              foregroundPainter:  LabelPaint(labelWidth: 30,labelOffset: 20,paintText: "12312",textStyle: const TextStyle(color: Colors.red,fontSize: 12)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20,),
            CustomPaint(
              foregroundPainter:  LabelPaint(labelWidth: 30,labelOffset: 20,paintText: "12312",labelPosition: LabelPosition.LeftBottom,textStyle: const TextStyle(color: Colors.yellow,fontSize: 12)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20,),
            CustomPaint(
              foregroundPainter:  LabelPaint(labelWidth: 30,labelOffset: 20,paintText: "12312",labelPosition: LabelPosition.RightTop,textStyle: const TextStyle(color: Colors.green,fontSize: 12)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20,),
            CustomPaint(
              foregroundPainter:  LabelPaint(labelWidth: 30,labelOffset: 20,paintText: "12312",labelPosition: LabelPosition.RightBottom,textStyle: const TextStyle(color: Colors.cyanAccent,fontSize: 12)),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            )
          ],
        ),
      )),
    );
  }

}