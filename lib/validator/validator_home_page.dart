

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/validator/email_validator_page.dart';

class ValidatorHomePage extends StatefulWidget {
  const ValidatorHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _ValidatorHomePageState();
}

class _ValidatorHomePageState extends State<ValidatorHomePage>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          commonItem("邮箱校验",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const EmailValidatorPage();
            }));
          }),
        ],
      ),
    );
  }

}