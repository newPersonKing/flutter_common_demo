import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/paint/wrapper/wrapper.dart';

import 'popup_menu.dart' as CusPopMenuButtom;

class ToolTipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          // PopupMenuButton 官方实现设置了最小宽度
          CusPopMenuButtom.PopupMenuButton<String>(
              width: 80,
              color: const Color(0xff7B5813),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (item) {},
              child: Container(
                width: 80,
                height: 21,
                color: Colors.amberAccent,
                child: const Text(
                  "主内容！！！！",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ),
              itemBuilder: (context) {
                // 可以通过只给第一个加wrapper 实现 箭头效果
                return ['会员交易记录', '常见问题']
                    .map((e) => CusPopMenuButtom.PopupMenuItem<String>(
                        padding: EdgeInsets.zero,
                        child: Wrapper(
                          spineType: SpineType.top,
                          child: Container(
                            width: 80,
                            height: 73,
                            alignment: Alignment.center,
                            color: const Color(0xff7B5813),
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: const Color(0xFFFFF8EB)),
                            ),
                          ),
                        )))
                    .toList();
              })
        ],
      )),
    );
  }
}
