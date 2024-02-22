

import 'dart:ui';

import 'package:flutter/material.dart';

class FourShadowPage extends StatefulWidget {
  const FourShadowPage({super.key});

  @override
  State<StatefulWidget> createState() => _FourShadowPageState();
}

class _FourShadowPageState extends State<FourShadowPage>{

  @override
  void initState() {
    super.initState();
    _loadShader();
  }

  FragmentShader? shader;
  void _loadShader() async {
    String path = 'shaders/four_shader_color.frag';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    if (shader == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Material(
      child: Center(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Padding(padding: EdgeInsets.all(15),
            child: CustomPaint(
              painter: FourShaderPainter(shader: shader!),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Text("q23123weqhahsfjkafhjadhjahkafajkfhkhkjhkjshdasdhkasdjk"),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

class FourShaderPainter extends CustomPainter {
  FourShaderPainter({required this.shader});

  FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    canvas.clipRRect(RRect.fromLTRBR(0, 0, size.width, size.height, const Radius.circular(10)));

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
