
// 1 自定义RenderObjectWidget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';

import 'get_widget_local_position.dart';

class RenderObjectWidgetCommonPage extends StatelessWidget {

  const RenderObjectWidgetCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("获取某个item的位置", (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const GetWidgetLocalPositionPage();
              }));
            })
          ],
        ),
      )),
    );
  }

}


