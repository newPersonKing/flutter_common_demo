

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstraintsPage extends StatelessWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            // 1 效果 文本达到一定宽度 自动换行
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(200,100)),
                  child: Text("数据少哦"),
                ),
                Text(":数据少哦")
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(200,100)),
                  child: Text("数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦数据多哦"),
                ),
                Text(":数据少哦")
              ],
            ),

          ],
        ),
      )),
    );
  }

}