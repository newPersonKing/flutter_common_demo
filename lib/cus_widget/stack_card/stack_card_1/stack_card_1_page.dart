

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/stack_card/stack_card_1/stack_view.dart';
import 'package:flutter_common_demo/generated/assets.dart';

class StackCard1Page extends StatefulWidget {
  const StackCard1Page({super.key});

  @override
  State<StatefulWidget> createState() => _StackCard1PageState();

}

class _StackCard1PageState extends State<StackCard1Page>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Center(
        child: StackView(
          buildWithIndex: (int index) {
            debugPrint("=========buildWithIndex===$index");
            if(index % 3 ==  0){
              return Image.asset(Assets.imagesHome1,width: double.infinity,height: double.infinity,fit: BoxFit.cover,);
            }
            if(index % 3 ==  1){
              return Image.asset(Assets.fashionFashion2,width: double.infinity,height: double.infinity,fit: BoxFit.cover,);
            }
            return Image.asset(Assets.imagesHome2,width: double.infinity,height: double.infinity,fit: BoxFit.cover,);
          },
        ),
      ),
    );
  }

}