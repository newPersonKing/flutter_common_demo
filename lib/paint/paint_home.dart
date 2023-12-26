import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/back_drop_filter/back_drop_filter_page.dart';
import 'package:flutter_common_demo/image/img_common.dart';
import 'package:flutter_common_demo/paint/paper.dart';
import 'package:flutter_common_demo/paint/paper_paint_page.dart';
import 'package:flutter_common_demo/paint/text_draw_line.dart';
import 'package:flutter_common_demo/paint/trans_image_page.dart';
import 'package:flutter_common_demo/paint/wrapper/kTransparentImage.dart';
import 'package:flutter_common_demo/paint/wrapper/paint_bg_image.dart';
import 'package:flutter_common_demo/paint/wrapper/tool_tip_page.dart';
import 'package:flutter_common_demo/paint/wx_gaussian_blur_page.dart';

import '../main.dart';
import 'DashBorderPage.dart';

class PaintHomePage extends StatelessWidget {
  const PaintHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("绘制虚线",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const DashBorderPage();
              }));
            }),
            commonItem("多色块 实现模糊",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const BackdropFilterPage();
              }));
            }),
            commonItem("wx 高斯模糊",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  WxGaussianBlurPage();
              }));
            }),
            commonItem("文本绘制横线",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  TextDrawLinePage();
              }));
            }),
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
            commonItem("透明图片",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return KTransparentImagePage();
              }));
            }),
            commonItem("绘制移动图片",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const DailyTracksCard(width: double.infinity,height: 150,
                    defaultTracksList: [
                      'https://lmg.jj20.com/up/allimg/1114/0406210Z024/2104060Z024-5-1200.jpg',
                      'https://lmg.jj20.com/up/allimg/1113/031920120534/200319120534-7-1200.jpg',
                      'https://lmg.jj20.com/up/allimg/1114/0G020114924/200G0114924-15-1200.jpg',
                    ]);
              }));
            }),
          ],
        ),
      ),
    );
  }

}