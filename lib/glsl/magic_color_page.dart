
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../box_decoration/flutter_neumorphic.dart';

class MagicColorPage extends StatefulWidget {

  const MagicColorPage({super.key});

  @override
  State<StatefulWidget> createState() => _MagicColorPageState();

}

class _MagicColorPageState extends State<MagicColorPage>{
  FragmentShader? shader;

  double currentTime =  0.0;
  @override
  void initState() {
    super.initState();
    _loadShader();
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        currentTime += 0.01;
      });
    });
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
        painter: _ShaderPainter(  shader: shader! ,currentTime: currentTime ),
      ),
    );
  }

  void _loadShader() async {
    String path = 'shaders/magic_color.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {});
  }
}

class _ShaderPainter extends CustomPainter {

  _ShaderPainter({required this.shader,required this.currentTime});

  FragmentShader shader;

  final double currentTime;
  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, currentTime);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}