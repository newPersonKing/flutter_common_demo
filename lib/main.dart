import 'package:flutter/material.dart';
import 'package:flutter_common_demo/bottom_app_bar_page.dart';
import 'package:flutter_common_demo/box_decoration/cus/cus_decoration_home_page.dart';
import 'package:flutter_common_demo/box_decoration/decoration_home_page.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/theme.dart';
import 'package:flutter_common_demo/dismissible_page/demo/demo.dart';
import 'package:flutter_common_demo/gesture/gesture_home_page.dart';
import 'package:flutter_common_demo/guide/guide_home_page.dart';
import 'package:flutter_common_demo/hyper_effects/hyper_effects_demo_page.dart';
import 'package:flutter_common_demo/listview/listview_home.dart';
import 'package:flutter_common_demo/page_route_builder/page_route_builder_home_page.dart';
import 'package:flutter_common_demo/paint/paint_home.dart';
import 'package:flutter_common_demo/slivers/sliverAnimatedList_page.dart';
import 'package:flutter_common_demo/statusbar/status_bar_page.dart';
import 'package:flutter_common_demo/system_api/system_ui.dart';
import 'package:flutter_common_demo/system_widget/system_widget_home_page.dart';
import 'package:flutter_common_demo/test_composited/test_composited_page.dart';
import 'package:flutter_common_demo/text/text_home_page.dart';
import 'package:flutter_common_demo/text_anim/text_anim_home.dart';
import 'package:flutter_common_demo/textfield/TextFieldHomePage.dart';
import 'package:flutter_common_demo/validator/validator_home_page.dart';
import 'FractionalTranslationPage.dart';
import 'box_decoration/src/app.dart';
import 'build_widget/BuilderWidgetPage.dart';
import 'constraints/constraints_page.dart';
import 'cus_widget/custom_widget_home.dart';
import 'decoration_blendmode/DecorationBlendModelPage.dart';
import 'guide/guide_1/sample/sample.dart';
import 'guide/guide_2/sample/guide_2_sample.dart';
import 'location/geolocator/geolocator_demo_page.dart';
import 'navigator_overlay/navigator_overlay_common.dart';


void main() async{
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
      backgroundColor: const Color(0xFFEA3B5C),
      body: ListView(
        children: [

          commonItem("Decoration BlendMode",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const DecorationBlendModelPage();
            }));
          }),

          commonItem("CusDecoration Examples",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const CusDecorationHomePage();
            }));
          }),

          commonItem("Guide Demo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const GuideDemoPage();
            }));
          }),


          commonItem("Decoration Examples",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const NeumorphicApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: ThemeMode.light,
                theme: NeumorphicThemeData(
                  baseColor: Color(0xFFFFFFFF),
                  lightSource: LightSource.topLeft,
                  depth: 10,
                ),
                darkTheme: NeumorphicThemeData(
                  baseColor: Color(0xFF3E3E3E),
                  lightSource: LightSource.topLeft,
                  depth: 6,
                ),
                home: DecorationHomePage(),
              );;
            }));
          }),


          commonItem("Dismissible Examples",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const AppView();
            }));
          }),

          commonItem("文字动画",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const TextAnimHomePage();
            }));
          }),

          commonItem("转场动画",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const PageRouteBuilderHomePage();
            }));
          }),

          commonItem("hyper effects demo",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const HyperEffectsDemoPage();
            }));
          }),

          commonItem("正则校验",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const ValidatorHomePage();
            }));
          }),

          commonItem("FractionalTranslation 使用",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const FractionalTranslationPage();
            }));
          }),

          commonItem("TextField() 测试",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const TextFieldHomePage();
            }));
          }),
          commonItem("geolocator 测试",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const GeolocatorWidget();
            }));
          }),
          commonItem("手势相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const GestureHomePage();
            }));
          }),
          commonItem("BottomAppBar 属性",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const BottomAppBarPage();
            }));
          }),
          commonItem("TextView 相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const TextHomePage();
            }));
          }),
          commonItem("状态栏相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return StatusBarPage();
            }));
          }),
          commonItem("Navigator_Overlay 相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const NavigatorOverlayCommonPage();
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
          commonItem("imageView / painter 相关",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  PaintHomePage();
            }));
          }),
          commonItem("有特殊效果的官方组件",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  SystemWidgetHomePage();
            }));
          }),
          commonItem("测试 Widget联动",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return  TestCompositedPage();
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
          // commonItem("测试",(){
          //   Navigator.push(context, MaterialPageRoute(builder: (context){
          //     return  ChatListScrollDemoPage2();
          //   }));
          // }),
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
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      child: Text(content,style: const TextStyle(fontSize: 16,color: Colors.black),),
    ),
  );
}
