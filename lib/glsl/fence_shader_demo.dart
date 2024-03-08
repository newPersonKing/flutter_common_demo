import 'dart:ui';

import 'package:flutter_common_demo/generated/assets.dart';

import 'package:flutter/material.dart';

class FenceShaderDemo extends StatefulWidget {
  const FenceShaderDemo({super.key});

  @override
  State<FenceShaderDemo> createState() => _FenceShaderDemoState();
}

class _FenceShaderDemoState extends State<FenceShaderDemo> {
  FragmentShader? shader;

  @override
  void initState() {
    super.initState();
    _loadShader();
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
        size: const Size(500 * 0.8, 658 * 0.8),
        painter: ShaderPainter(  shader: shader!  ),
      ),
    );
  }

  void _loadShader() async {
    String path = 'shaders/fence.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {});
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader});

  FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, 0);
    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

