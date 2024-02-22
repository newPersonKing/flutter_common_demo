
import 'dart:async';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final String a= "";
  const TestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TestPageState();
}

class TestPageState extends State<TestPage>{

  List<InlineSpan> spnas = [];
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      debugPrint("======13132");
      setState(() {
        // spnas = [];
        spnas.add(TextSpan(text: "1",style: TextStyle(
            fontSize: 20,
            color: Colors.green
        )));
        spnas.add(TextSpan(text: "2",style: TextStyle(
            fontSize: 20,
            color: Colors.green
        )));
      });
    });
    spnas.add(TextSpan(text: "1",style: TextStyle(
        fontSize: 20,
        color: Colors.green
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          spnas.isNotEmpty ? RichText(text: TextSpan(children: spnas)):SizedBox()
        ],
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





