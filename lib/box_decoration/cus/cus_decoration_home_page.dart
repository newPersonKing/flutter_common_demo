
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/box_decoration/src/decoration/neumorphic_decorations.dart';
import 'package:flutter_common_demo/box_decoration/src/neumorphic_box_shape.dart';
import 'package:flutter_common_demo/box_decoration/src/shape/neumorphic_path_provider.dart';
import 'package:flutter_common_demo/box_decoration/src/shape/stadium_path_provider.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/neumorphic_theme.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/theme.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/clipper/neumorphic_box_shape_clipper.dart';

class CusDecorationHomePage extends StatefulWidget {

  const CusDecorationHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CusDecorationHomePageState();


}

class _CusDecorationHomePageState extends State<CusDecorationHomePage>{
  var shape = NeumorphicBoxShape.circle();


  @override
  Widget build(BuildContext context) {

    // return Material(
    //   color: Colors.white,
    //   child: Center(
    //       child:  Container(
    //         // margin: margin,
    //         // duration: duration,
    //         // curve: curve,
    //         child: NeumorphicBoxShapeClipper(
    //           shape: shape,
    //           child: Padding(
    //             padding: EdgeInsets.all(5),
    //             child: Icon(
    //               Icons.favorite_border,
    //               color: _iconsColor(context),
    //             ),
    //           ),
    //         ),
    //         // foregroundDecoration: NeumorphicDecoration(
    //         //   isForeground: true,
    //         //   renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
    //         //   splitBackgroundForeground: drawSurfaceAboveChild,
    //         //   style: style,
    //         //   shape: shape,
    //         // ),
    //         decoration: NeumorphicDecoration(
    //           isForeground: false,
    //           renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
    //           splitBackgroundForeground: false,
    //           style: NeumorphicStyle().copyWithThemeIfNull(NeumorphicTheme.currentTheme(context)),
    //           shape: shape,
    //         ),
    //       )
    //   ),
    // );

    return Material(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: NeumorphicDecoration(
                isForeground: false,
                renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
                splitBackgroundForeground: false,
                style: const NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 5,
                  border: NeumorphicBorder(width: 2,color: Colors.red)
                ).copyWithThemeIfNull(NeumorphicTheme.currentTheme(context)),
                shape: shape,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text("去happy"),
              ),
              decoration: NeumorphicDecoration(
                isForeground: false,
                renderingByPath: shape.customShapePathProvider.oneGradientPerPath,
                splitBackgroundForeground: false,
                style: const NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 5,
                ).copyWithThemeIfNull(NeumorphicTheme.currentTheme(context)),
                shape: shape,
              ),
            ),
          ],
        )
    );
  }

  Color _iconsColor(BuildContext context) {
    return Colors.red;
  }
}