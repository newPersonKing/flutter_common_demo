

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/gesture/out_click/out_click_test_page.dart';
import 'package:flutter_common_demo/gesture/hit_test_behavior_demo.dart';

import '../main.dart';

class GestureHomePage extends StatelessWidget {

  const GestureHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      child: SingleChildScrollView(
        child: Column(
         children: [
           commonItem("TapRegion 响应点击组件外部",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const OutClickTestPage();
             }));
           }),
           commonItem("HitTestBehaviorDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const HitTestBehaviorDemo();
             }));
           }),
         ],
        ),
      ),
    );
  }
}