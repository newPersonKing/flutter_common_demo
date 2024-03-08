

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/textfield/format_page.dart';
import 'package:flutter_common_demo/textfield/inputformart/formart3/multi_formatter_demo_page.dart';
import 'package:flutter_common_demo/textfield/inputformart/text_input_formatter_card.dart';
import 'package:flutter_common_demo/textfield/text_field_anim_label/main.dart';
import 'package:flutter_common_demo/textfield/textfield_use.dart';

import 'inputformart/ThousandsFormatter.dart';

class TextFieldHomePage extends StatefulWidget {
  const TextFieldHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _TextFieldHomePageState();

}

class _TextFieldHomePageState extends State<TextFieldHomePage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        children: [
          commonItem("TextField 属性使用", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const TextFieldUsePage();
            }));
          }),
          commonItem("format", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const FormatPage();
            }));
          }),
          commonItem("multi format", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const MultiFormatterDemoPage();
            }));
          }),
          commonItem("Anim Label", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const TextFieldAnimLabelPage(title: "Anim Label",);
            }));
          })
        ],
      ),
    );
  }

}