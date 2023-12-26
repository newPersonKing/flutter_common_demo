

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/guide/guide_3/sample/guide_demo_3.dart';

import '../main.dart';
import 'guide_1/sample/sample.dart';
import 'guide_2/sample/guide_2_sample.dart';

class GuideDemoPage extends StatelessWidget {

  const GuideDemoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: ListView(
        children: [

          commonItem("Guide3 Sample Page",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const GuideDemo3Page();
            }));
          }),


          commonItem("Guide2 Sample Page",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const StartPage();
            }));
          }),

          commonItem("Guide1 Sample Page",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SamplePage();
            }));
          }),
        ],
      ),
    );
  }

}