import 'dart:ui';

import 'package:flutter_common_demo/generated/assets.dart';

import 'package:flutter/material.dart';
class ColourShaderPage extends StatefulWidget {
  const ColourShaderPage({super.key});

  @override
  State<ColourShaderPage> createState() => _ColourShaderPageState();
}

class _ColourShaderPageState extends State<ColourShaderPage> with SingleTickerProviderStateMixin{
  FragmentShader? shader;

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _loadShader();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    if (shader == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
      child: CustomPaint(
        size: const Size(400, 400),
        painter: ShaderPainter(  shader: shader!  ,animationController: animationController),
      ),
    );
  }

  void _loadShader() async {
    String path = 'shaders/colour.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        animationController.repeat();
      });
    });
  }
}

class ShaderPainter extends CustomPainter {
  AnimationController animationController;
  ShaderPainter({required this.shader,required this.animationController}):super(repaint: animationController);

  FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width / 4);
    shader.setFloat(1, size.height / 4);
    shader.setFloat(2, animationController.value * 10);
    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

