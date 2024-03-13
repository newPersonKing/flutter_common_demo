
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_1/stack_card_1_page.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_2/stack_card_2_page.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_3/example/stack_card_3_demo.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_4/example/stack_card_4_page.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_5/example/stack_card_5_page.dart';

import '../../main.dart';

class StackDemoPage extends StatelessWidget {

  const StackDemoPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
          child: ListView(
            children: [
              commonItem("Stack_Card_1",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const StackCard1Page();
                }));
              }),
              commonItem("Stack_Card_2",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const StackCard2Page();
                }));
              }),
              commonItem("Stack_Card_3",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const StackCard3Page();
                }));
              }),
              commonItem("Stack_Card_4",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const StackCard4Page();
                }));
              }),
              commonItem("Stack_Card_5",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const TCardPage();
                }));
              }),
            ],
          )
      ),
    );
  }

}