

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';

/*
* hitTestChildren 判断是否有自节点命中  hitTestSelf 判断自己是否命中  如果都没有命中且behavior == HitTestBehavior.translucent
* 也会判定自己命中
*   @override
  bool hitTest(BoxHitTestResult result, { required Offset position }) {
    bool hitTarget = false;
    if (size.contains(position)) {
      hitTarget = hitTestChildren(result, position: position) || hitTestSelf(position);
      if (hitTarget || behavior == HitTestBehavior.translucent) {
        result.add(BoxHitTestEntry(this, position));
      }
    }
    return hitTarget;
  }

  @override
  bool hitTestSelf(Offset position) => behavior == HitTestBehavior.opaque;
* */

class HitTestBehaviorDemo extends StatelessWidget{

  const HitTestBehaviorDemo({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15)
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.deferToChild, // 设置后点击空白区域无响应
          // behavior: HitTestBehavior.translucent,// 设置后点击空白区域有响应
          onTap: () {
            print("==========触发点击事件=====");
          },
          child: Container(
            alignment: Alignment.center,
            height:150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(Assets.imagesFlutter, width:50),
                Spacer(),
                ColoredBox(
                  color: Colors.red.withOpacity(0.5),
                  child: Text("color _red",style: TextStyle(
                      fontSize: 20
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}