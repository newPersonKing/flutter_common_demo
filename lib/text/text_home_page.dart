

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/text/rich_text_1/page/multi_highlight_text_home_page.dart';
import 'package:flutter_common_demo/text/text_count_compute_page.dart';
import 'package:flutter_common_demo/text/text_shadow_demo.dart';

import '../main.dart';

class TextHomePage extends StatelessWidget {

  const TextHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      child: SingleChildScrollView(
        child: Column(
         children: [
           commonItem("textPainter 计算文本行数",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  TextCountComputePage();
             }));
           }),
           //包含多样式重叠 点击出悬浮窗
           commonItem("Rich Text 的封装使用",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const MultiHighlightTextHomePage();
             }));
           }),
           commonItem("TextShadowDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const TextShadowDemo();
             }));
           }),
         ],
        ),
      ),
    );
  }
}