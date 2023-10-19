

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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   controller.forward();
    // });
    // controller.addListener(() {
    //   setState(() {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child: Container(
            alignment: Alignment.topCenter,
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return Container(height: 100,width: double.infinity,color: Colors.green,child: Text("$index"),);
                },
                reverse: true,
                itemCount: 3),
          )),
          Container(height: 100,width: double.infinity,color: Colors.yellow,)
        ],
      ),
    );
  }
}