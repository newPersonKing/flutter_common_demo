

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_1/example/time_line_1_demo.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_2/example/showcase_timeline_tile.dart';
import 'package:flutter_common_demo/main.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            commonItem("Time_Line_1",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const TimeLine1Demo();
              }));
            }),
            commonItem("Time_Line_2",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ShowcaseTimelineTile();
              }));
            }),
          ],
        ),
      ),
    );
  }

}