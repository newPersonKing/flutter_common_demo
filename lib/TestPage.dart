
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TestPageState();
}

class TestPageState extends State<TestPage>{
  var texts = [1,2];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: GestureDetector(
        onTap: (){
          texts.add(1);
          setState(() {

          });
        },
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.yellow,
          child: Row(
            children: [
              Expanded(child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: texts.map((e) => Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 10),
                      color: Colors.grey,
                    )).toList(),
                  ),
                ),
              ))


            ],
          ),
        ),
      ),
    );
  }

}