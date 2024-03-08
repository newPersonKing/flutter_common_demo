

import 'package:flutter_common_demo/cus_widget/box_decoration/decoration_home_page.dart';
import 'package:flutter_common_demo/main.dart';

import '../flutter_neumorphic.dart';
import 'decoration_blendmode/DecorationBlendModelPage.dart';
class CusDecorationHomePage extends StatefulWidget {

  const CusDecorationHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CusDecorationHomePageState();

}

class _CusDecorationHomePageState extends State<CusDecorationHomePage>{
  var shape = const NeumorphicBoxShape.circle();


  @override
  Widget build(BuildContext context) {

    return Material(
        color: Colors.white,
        child: SafeArea(
          child: ListView(
            children: [
              commonItem("colorFilter blendMode",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const DecorationBlendModelPage();
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
            ],
          ),
        )
    );
  }

  Color _iconsColor(BuildContext context) {
    return Colors.red;
  }
}