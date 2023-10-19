

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// FittedBox 知识点
// 1 可以让子view 根据一定约束自适应宽度 高度 裁切
class FittedBoxDemo extends StatefulWidget {
  const FittedBoxDemo({super.key});

  @override
  State<StatefulWidget> createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo>{

  var textStr = "这是段橘子";
  var textStrLong = "这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子这是段橘子";

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        children: [
          Container(width: 200,height: 200,
            color: Colors.green,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              clipBehavior: Clip.none,
              child: Text(textStr,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),),
        ],
      ),
    );

  }

}