

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 修改状态栏的颜色 跟底部导航栏的颜色
class StatusBarColorPage extends StatelessWidget {

  const StatusBarColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.yellow,
          statusBarColor: Colors.green.withAlpha(80)
      ),
      child: Container(
        color: Colors.red,
      ),
    );
  }
}