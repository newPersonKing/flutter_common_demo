

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/glsl/circle_and_circle_shader_page.dart';
import 'package:flutter_common_demo/glsl/color_shader_demo.dart';
import 'package:flutter_common_demo/glsl/colour_shader_page.dart';
import 'package:flutter_common_demo/glsl/fence_shader_demo.dart';
import 'package:flutter_common_demo/glsl/fractal_pyramid_shader_page.dart';
import 'package:flutter_common_demo/glsl/magic_color_page.dart';
import 'package:flutter_common_demo/glsl/pincus_shader_demo.dart';
import 'package:flutter_common_demo/main.dart';

class GLSLMainPage extends StatefulWidget {
  const GLSLMainPage({super.key});

  @override
  State<StatefulWidget> createState() => _GLSLMainPageState();

}

class _GLSLMainPageState extends State<GLSLMainPage>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("fractal pyramid  分形金字塔", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const FractalPyramidShaderPage();
              }));
            }),
            commonItem("色彩斑斓的水波纹", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ColourShaderPage();
              }));
            }),
            commonItem("circle_and_circle", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CircleAndCircleShaderPage();
              }));
            }),
            commonItem("magic_color", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const MagicColorPage();
              }));
            }),
            commonItem("拉伸图片", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const FenceShaderDemo();
              }));
            }),
            commonItem("color_shader", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const PincusShaderDemo();
              }));
            }),
            commonItem("color_shader", () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ColorShaderDemo();
              }));
            }),
          ],
        ),
      ),
    );
  }

}