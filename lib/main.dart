import 'package:flutter/material.dart';
import 'package:flutter_common_demo/listview/listview_home.dart';
import 'package:flutter_common_demo/paint/paint_home.dart';
import 'package:flutter_common_demo/render_object_widget/render_object_widget_common.dart';
import 'package:flutter_common_demo/statusbar/status_bar_page.dart';
import 'package:flutter_common_demo/system_api/system_ui.dart';
import 'package:flutter_common_demo/tabbar/tab_bar_home.dart';

import 'constraints/constraints_page.dart';
import 'cus_widget/custom_widget_home.dart';
import 'image/img_common.dart';
import 'navigator_overlay/navigator_overlay_common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: ListView(
        children: [
          commonItem("状态栏相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return StatusBarPage();
            }));
          }),
          commonItem("imageView 相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ImageCommonPage();
            }));
          }),
          commonItem("Navigator_Overlay 相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const NavigatorOverlayCommonPage();
            }));
          }),
          commonItem("自定义 RenderObject",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const RenderObjectWidgetCommonPage();
            }));
          }),
          commonItem("约束",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ConstraintsPage();
            }));
          }),
          commonItem("listView",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ListViewHomePage();
            }));
          }),
          commonItem("自定义相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const CustomWidgetHome();
            }));
          }),
          commonItem("系统api 尺寸",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  SystemApiPage();
            }));
          }),
          commonItem("tabBar",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  TabBarPage();
            }));
          }),
          commonItem("painter",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  PaintHomePage();
            }));
          }),
        ],
      ),
    );
  }

}

Widget commonItem(String content,VoidCallback clickBack){
  return GestureDetector(
    onTap: (){
      clickBack.call();
    },
    child:  Container(
      margin: const EdgeInsets.all(15),
      color: Colors.blue,
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text(content,style: const TextStyle(fontSize: 16,color: Colors.red),),
    ),
  );
}
