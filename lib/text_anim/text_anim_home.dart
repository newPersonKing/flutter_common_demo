

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/text_anim/text_anim_1/widget_animator_demo.dart';

class TextAnimHomePage extends StatelessWidget {
  const TextAnimHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: ListView(
        children: [
          commonItem("WidgetAnimator", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const WidgetAnimatorDemo(title: "测试文字动画");
            }));
          })
        ],
      ),
    );
  }

}