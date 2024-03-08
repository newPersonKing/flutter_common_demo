

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TextField 属性使用
class TextFieldUsePage extends StatelessWidget {

  const TextFieldUsePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // isCollapsed 取消TextField的默认高度
            Row(
              children: [
                SizedBox(width: 15,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "设置isCollapsed为true",
                    isCollapsed: true
                  ),
                )),
                SizedBox(width: 15,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                      hintText: "设置isCollapsed为false",
                      isCollapsed: false
                  ),
                )),
                SizedBox(width: 15,),
              ],
            ),

            SizedBox(height: 30),
            //根据文本自适应高度
            TextField(
              minLines: 1,
              maxLines: 100,
              decoration: InputDecoration(
                hintText: "根据文本自适应高度"
              ),
            )
          ],
        ),
      ),
    );
  }

}