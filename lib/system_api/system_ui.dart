import 'package:flutter/material.dart';

class SystemApiPage extends StatelessWidget {
  const SystemApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Material(
      child: Column(
        children: [
          Container(
            height: padding.top,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Text("状态栏高度 或者说异形屏顶部适配高度:${padding.top}"),
          ),
        ],
      ),
    );
  }
}

