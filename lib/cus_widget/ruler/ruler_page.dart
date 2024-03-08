

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/ruler/ruler1/xb_ruler_demo.dart';
import 'package:gap/gap.dart';

import '../../main.dart';

class RulerPage extends StatefulWidget {
  const RulerPage({super.key});

  @override
  State<StatefulWidget> createState() => _RulerPageState();
}

class _RulerPageState extends State<RulerPage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: ListView(
        children: [
          Gap(20),
          commonItem("XBRuler",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const XBRulerPage();
            }));
          }),
        ],
      ),
    );
  }

}