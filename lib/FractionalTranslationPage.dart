

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';
import 'package:flutter_common_demo/network/print.dart';

class FractionalTranslationPage extends StatelessWidget {
  const FractionalTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: FractionalTranslation(
            //偏移量是 Offset.value 乘以 child的size
            translation: const Offset(2,0),
            child: GestureDetector(
              onTap: (){
                printMsg("click=====");
              },
              child: Image.asset(Assets.imagesIcon360,width: 50,height: 50,fit: BoxFit.fill,),
            ),
          ),
        ),
      ),
    );
  }

}