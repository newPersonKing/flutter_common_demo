

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutClickTestPage extends StatelessWidget {
  const OutClickTestPage({super.key});

  @override
  Widget build(BuildContext context) {

    // groupId 的作用是把多个区域合并到一起
    return Material(
      color: Colors.yellow,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TapRegion(
            groupId: Container,
            onTapInside: (event){
              //监听点击child的内部
              debugPrint("ccccc===onTapInside==${event.position}");
            },
            onTapOutside: (event){
              //监听点击child的外部
              debugPrint("cccccc=====onTapOutside==${event.position}");
            },
            child: GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: TapRegion(
                groupId: Container,
                child: Container(width: 100,height: 100,color: Colors.green,)
            ),
          )
        ],

      ),
    );
  }
}