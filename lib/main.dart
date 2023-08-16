import 'package:flutter/material.dart';
import 'package:flutter_common_demo/TestPage.dart';
import 'package:flutter_common_demo/back_drop_filter/back_drop_filter_page.dart';
import 'package:flutter_common_demo/demo/page_storage_demo.dart';
import 'package:flutter_common_demo/listview/listview_home.dart';
import 'package:flutter_common_demo/out_click/out_click_test_page.dart';
import 'package:flutter_common_demo/paint/paint_home.dart';
import 'package:flutter_common_demo/pay_web/cotti_pay_web_view.dart';
import 'package:flutter_common_demo/pro/register.dart';
import 'package:flutter_common_demo/render_object_widget/render_object_widget_common.dart';
import 'package:flutter_common_demo/select/drop_down_select.dart';
import 'package:flutter_common_demo/slivers/sliverAnimatedList_page.dart';
import 'package:flutter_common_demo/statusbar/status_bar_page.dart';
import 'package:flutter_common_demo/system_api/system_ui.dart';
import 'package:flutter_common_demo/tabbar/tab_bar_home.dart';
import 'package:flutter_common_demo/test_composited/test_composited_page.dart';
import 'package:flutter_common_demo/text/text_count_compute_page.dart';
import 'package:flutter_common_demo/widget_show/widget_show_page.dart';

import 'bloc_example.dart';
import 'build_widget/BuilderWidgetPage.dart';
import 'constraints/constraints_page.dart';
import 'cus_widget/custom_widget_home.dart';
import 'cus_widget/sliding_up_panel/sliding_panel_demo.dart';
import 'demo/fitted_box_demo.dart';
import 'demo/over_flow_bar_demo.dart';
import 'demo/over_flow_box_demo.dart';
import 'demo/paginated_data_table_demo.dart';
import 'drag_float/drag_float_page.dart';
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
          commonItem("PaginatedDataTableDemo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PaginatedDataTableDemo();
            }));
          }),
          commonItem("PageStorageDemo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PageStorageDemo();
            }));
          }),
          commonItem("FittedoxDemo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return FittedBoxDemo();
            }));
          }),
          commonItem("OverflowBoxDemo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return OverflowBoxDemo();
            }));
          }),
          commonItem("OverflowBarDemo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return OverflowBarDemo();
            }));
          }),
          commonItem("sliding_panel",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SlidingPanelDemo();
            }));
          }),
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
          commonItem("官方组件",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  WidgetShowPage();
            }));
          }),
          commonItem("TapRegion 响应点击组件外部",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  OutClickTestPage();
            }));
          }),
          commonItem("测试 Widget联动",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  TestCompositedPage();
            }));
          }),
          commonItem("BackdropFilter 实现模糊",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  const BackdropFilterPage();
            }));
          }),
          commonItem("可拖动悬浮按钮",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  const DragFloatPage();
            }));
          }),
          commonItem("SliverAnimatedList",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  const SliverPart3SliverAnimatedList();
            }));
          }),
          commonItem("BuildContext的妙用",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  const BuilderWidgetPage();
            }));
          }),
          commonItem("下拉选择",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  DropDownSelectWidget();
            }));
          }),
          commonItem("textPainter 计算文本行数",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  TextCountComputePage();
            }));
          }),
          commonItem("测试",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  BlocExamplePage();
            }));
          }),
          commonItem("潇潇",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  RegisterPage();
            }));
          }),
          commonItem("点击展示",(){
            showPay();
          }),
        ],
      ),
    );
  }

  showPay() {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) {
    //     return Container(
    //       color: Colors.white,
    //       padding: EdgeInsets.all(24),
    //       height: 320,
    //       child: Column(
    //         children: [
    //           const Padding(
    //             padding: EdgeInsets.only(bottom: 24),
    //             child: Text('切换环境'),
    //           ),
    //           CottiPayWebView(url: "",)
    //         ],
    //       ),
    //     );
    //   },
    // );

    showModalBottomSheet<bool>(
      context: context,
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          child: const SizedBox(
            height: 300,
            // color: Colors.white,
            child: TextField(
              maxLength: 100,
              maxLines: 5,
            ),
          ),
        );
      },
      isDismissible: false,
      isScrollControlled: true,);
  }
}

Widget commonItem(String content,VoidCallback clickBack){
  return GestureDetector(
    onTap: (){
      clickBack.call();
    },
    child:  Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.rectangle,
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text(content,style: const TextStyle(fontSize: 16,color: Colors.black),),
    ),
  );
}
