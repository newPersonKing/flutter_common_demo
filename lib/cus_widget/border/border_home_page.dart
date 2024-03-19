
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/border/border_1/border_1_demo.dart';
import 'package:flutter_common_demo/cus_widget/border/border_10/border_10_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_11/border_11_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_12/border_12_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_13/border_13_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_2/border_2_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_3/border_3_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_4/border_4_page.dart';
import 'package:flutter_common_demo/cus_widget/border/border_9/border_9_page.dart';

import '../../main.dart';
import 'border_5/border_5_page.dart';
import 'border_6/border_6_page.dart';
import 'border_7/border_7_page.dart';
import 'border_8/border_8_page.dart';

class BorderHomePage extends StatelessWidget {
  const BorderHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            commonItem("Anim Loading border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Border1Demo();
              }));
            }),
            commonItem("Progress Border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Border2Page();
              }));
            }),
            commonItem("non uniform Border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Border3Page();
              }));
            }),
            commonItem("borderText",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Border4Page();
              }));
            }),
            commonItem("Shape Border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Border5Page();
              }));
            }),
            commonItem("dot line Border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border6Page();
              }));
            }),
            commonItem("glowy border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border7Page();
              }));
            }),
            commonItem("progress button",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border8Page();
              }));
            }),
            commonItem("polygon border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border9Page();
              }));
            }),
            commonItem("multi border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border10Page();
              }));
            }),
            commonItem("badge  border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border11Page();
              }));
            }),

            commonItem("diagonal(对角线)  border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border12Page();
              }));
            }),

            commonItem("gradient border",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  const Border13Page();
              }));
            }),
          ],
        ),
      ),
    );
  }
}