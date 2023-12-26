import 'package:flutter/material.dart';
import 'package:flutter_common_demo/hyper_effects/demo/scroll_wheel_blur.dart';
import 'package:flutter_common_demo/hyper_effects/demo/spring_animation.dart';
import 'package:flutter_common_demo/hyper_effects/demo/windows_settings_transition.dart';
import 'package:flutter_common_demo/main.dart';

import 'demo/color_filter_scroll_transition.dart';
import 'demo/scroll_phase_transition.dart';
import 'demo/scroll_wheel_transition.dart';

class HyperEffectsDemoPage extends StatelessWidget {
  const HyperEffectsDemoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      child: ListView(
        children: [
          commonItem("Spring",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SpringAnimation();
            }));
          }),
          commonItem("滑动 监听 ScrollPhaseTransition",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ScrollPhaseTransition();
            }));
          }),
          commonItem("滑动 监听 FashionScrollTransition",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const FashionScrollTransition();
            }));
          }),
          commonItem("滑动 监听  轮子滚动 ScrollWheelTransition",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ScrollWheelTransition();
            }));
          }),
          commonItem("滑动 监听  轮子滚动  加 模糊 ScrollWheelTransition",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ScrollWheelBlurTransition();
            }));
          }),
          commonItem("滑动 监听  轮子滚动  加 模糊 ScrollWheelTransition",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const WindowsSettingsTransition();
            }));
          }),
        ],
      ),
    );
  }

}