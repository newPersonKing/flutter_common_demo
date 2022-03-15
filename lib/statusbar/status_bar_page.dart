
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/statusbar/status_bar_color.dart';

class StatusBarPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Material(
      child: ListView(
        children: [
          commonItem("SystemUiOverlayStyle.light", (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const StatusBarColorPage();
              }));
          })
        ],
      ),
    );
  }

}