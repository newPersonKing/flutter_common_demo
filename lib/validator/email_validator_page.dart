
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/network/print.dart';
import 'package:flutter_common_demo/validator/EmailValidator.dart';
class EmailValidatorPage extends StatefulWidget {
  const EmailValidatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _EmailValidatorPageState();

}


class _EmailValidatorPageState extends State<EmailValidatorPage>{

  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: emailController,
            ),
            GestureDetector(
              onTap: (){
                var isPass = EmailValidator.validate(emailController.text);
                printMsg("isPass===${isPass}");
              },
              child:  Container(
                height: 50,
                color: Colors.amber,
                child: const Text("Check Email",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red
                  ),),
              ),
            )
          ],
        ),
      ),
    );
  }

}