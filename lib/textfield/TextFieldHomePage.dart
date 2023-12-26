

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/textfield/inputformart/CurrencyTextInputFormatter.dart';
import 'package:flutter_common_demo/textfield/inputformart/DateInputFormatter.dart';
import 'package:flutter_common_demo/textfield/inputformart/MaskTextInputFormatter.dart';
import 'package:flutter_common_demo/textfield/inputformart/text_input_formatter_card.dart';
import 'package:flutter_common_demo/textfield/text_field_anim_label/main.dart';

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
          const SizedBox(height: 40,),
          Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: TextField(
                inputFormatters: [
                  TextInputFormatterCard()
                ],
                decoration: const InputDecoration(
                    hintText: "每四位数字加空格"
                ),
              )
          ),
          const SizedBox(height: 10,),
          Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: TextField(
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: '+# (###) ###-##-##',
                      filter: { "#": RegExp(r'[0-9]') },
                      type: MaskAutoCompletionType.lazy
                  )
                ],
                decoration: const InputDecoration(
                    hintText: "MaskTextInputFormatter"
                ),
              )
          ),
          const SizedBox(height: 10,),
          Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: TextField(
                inputFormatters: [
                  CurrencyTextInputFormatter()
                ],
                decoration: const InputDecoration(
                    hintText: "CurrencyTextInputFormatter"
                ),
              )
          ),
          const SizedBox(height: 10,),
          Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: TextField(
                inputFormatters: [
                  DateInputFormatter()
                ],
                decoration: const InputDecoration(
                    hintText: "DateInputFormatter"
                ),
              )
          ),
          const SizedBox(height: 10,),
          Container(
              width: double.infinity,
              height: 50,
              color: Colors.amber,
              child: TextField(
                inputFormatters: [
                  ThousandsFormatter()
                ],
                decoration: const InputDecoration(
                    hintText: "ThousandsFormatter"
                ),
              )
          ),
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