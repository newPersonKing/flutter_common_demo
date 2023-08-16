

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverflowBoxDemo extends StatefulWidget {

  const OverflowBoxDemo({super.key});

  @override
  State<StatefulWidget> createState() => _OverflowBoxDemoState();

}

class _OverflowBoxDemoState extends State<OverflowBoxDemo>{

  var size = Size(150, 100);
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.red,
              child: Container(
                height: 250,
                width: 250,
                color: Colors.blue.withOpacity(.5),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.red,
              child: OverflowBox(
                minWidth: 50,
                minHeight: 50,
                maxWidth: 300,
                maxHeight: 300,
                child: Container(
                  height: size.height, // 无效，最终为300
                  width: size.width,
                  color: Colors.blue.withOpacity(.5),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  size = size + const Offset(10,10);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: const Text("changeSize",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }


}