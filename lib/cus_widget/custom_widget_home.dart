

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'label/label_page.dart';

class CustomWidgetHome extends StatelessWidget {
  const CustomWidgetHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("Label",(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LabelPage();
              }));
            }),
          ],
        ),
      )),
    );
  }

}