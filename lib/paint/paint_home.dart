import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/image/img_common.dart';
import 'package:flutter_common_demo/paint/paper.dart';
import 'package:flutter_common_demo/paint/paper_paint_page.dart';
import 'package:flutter_common_demo/paint/wrapper/paint_bg_image.dart';
import 'package:flutter_common_demo/paint/wrapper/tool_tip_page.dart';

import '../main.dart';

class PaintHomePage extends StatelessWidget {
  const PaintHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("imageView 圆角",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const ImageCommonPage();
              }));
            }),
            commonItem("简单绘制",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  Paper();
              }));
            }),
            commonItem("简单绘制",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  ToolTipPage();
              }));
            }),
            commonItem("绘制大图部分内容",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PaintBgPage();
              }));
            }),
          ],
        ),
      ),
    );
  }

}