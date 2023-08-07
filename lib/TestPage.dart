
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TestPageState();
}

class TestPageState extends State<TestPage>{

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: Center(
        child: GestureDetector(
          onTap: (){
            print("out_click");
          },
          child: Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey,
            child: GestureDetector(
              onTap: (){
                print("inner_click");
              },
              child: Center(
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

void main(){
 runApp(TestPage());
}

class CD extends State<StatefulWidget> with RestorationMixin {
  @override
  Widget build(BuildContext context) {
    return Text("${_counter.value}");
  }

  final RestorableInt _counter = RestorableInt(0);
  
  @override
  String? get restorationId => "restorationId";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_counter, "count");
  }

}





