import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/paint/paper.dart';
import 'package:flutter_common_demo/paint/paper_paint_page.dart';
import 'package:flutter_common_demo/paint/wrapper/tool_tip_page.dart';

import '../main.dart';

class PaintHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }

}