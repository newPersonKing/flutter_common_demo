

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/main.dart';
import 'package:flutter_common_demo/page_route_builder/page_flip/page_flip_1.dart';
import 'package:flutter_common_demo/page_route_builder/page_flip/page_flip_2.dart';
import 'package:flutter_common_demo/page_route_builder/type_1/type_1_demo.dart';

class PageRouteBuilderHomePage extends StatefulWidget {
  const PageRouteBuilderHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _PageRouteBuilderHomePageState();

}

class _PageRouteBuilderHomePageState extends State<PageRouteBuilderHomePage> {
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: ListView(
        children: [
          commonItem("slide fade scale 转场",(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Type1Demo();
            }));
          }),
          commonItem("page flip 1",(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return PageFlipDemo1();
            }));
          }),
          commonItem("page flip 2",(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return PageFlip2();
            }));
          })
        ],
      ),
    );
  }


}