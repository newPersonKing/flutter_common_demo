

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/progress/progress_1/progress_1_demo.dart';
import 'package:flutter_common_demo/cus_widget/progress/progress_2/progress_2_demo.dart';
import 'package:flutter_common_demo/cus_widget/progress/progress_3/progress_3_demo.dart';

import '../../main.dart';

class ProgressHomePage extends StatelessWidget {
  const ProgressHomePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            commonItem("Progress_TimeRange",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Progress1Demo();
              }));
            }),
            commonItem("Progress_Count_Down",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Progress2Demo();
              }));
            }),
            commonItem("Progress_Sleep_Time_select",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Progress3Page();
              }));
            }),
          ],
        ),
      ),
    );
  }


}