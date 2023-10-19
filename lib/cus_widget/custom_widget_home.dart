

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/check/people_check.dart';
import 'package:flutter_common_demo/cus_widget/sliding_up_panel/sliding_panel_demo.dart';
import 'package:flutter_common_demo/drag_float/drag_float_page.dart';
import 'package:flutter_common_demo/render_object_widget/render_object_widget_common.dart';
import 'package:flutter_common_demo/select/drop_down_select.dart';

import '../main.dart';
import 'label/label_page.dart';

class CustomWidgetHome extends StatelessWidget {
  const CustomWidgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("Label",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LabelPage();
              }));
            }),
            commonItem("sliding_panel",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SlidingPanelDemo();
              }));
            }),
            commonItem("自定义 RenderObject",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const RenderObjectWidgetCommonPage();
              }));
            }),
            commonItem("可拖动悬浮按钮",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const DragFloatPage();
              }));
            }),
            commonItem("下拉选择",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  DropDownSelectWidget();
              }));
            }),
            commonItem("人机验证",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const PeopleCheckPage();
              }));
            }),
          ],
        ),
      )),
    );
  }

}