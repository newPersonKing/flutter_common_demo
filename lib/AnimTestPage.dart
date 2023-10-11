

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestPageState();


}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Container(
        width: controller.value * 100,
        height: controller.value * 100,
        child: Image.asset(Assets.imagesBg),
      ),
    );
  }

}