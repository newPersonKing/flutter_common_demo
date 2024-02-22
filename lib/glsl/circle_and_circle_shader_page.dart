import 'dart:ui';

import 'package:flutter_common_demo/generated/assets.dart';

import '../box_decoration/flutter_neumorphic.dart';

class CircleAndCircleShaderPage extends StatefulWidget {
  const CircleAndCircleShaderPage({super.key});

  @override
  State<CircleAndCircleShaderPage> createState() => _CircleAndCircleShaderPageState();
}

class _CircleAndCircleShaderPageState extends State<CircleAndCircleShaderPage>  with SingleTickerProviderStateMixin{
  FragmentShader? shader;
 late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _loadShader();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 10));
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
        size: const Size(300, 300),
        painter: _ShaderPainter(  shader: shader!,controller: animationController),
      ),
    );
  }

  void _loadShader() async {
    String path = 'shaders/circle_and_circle.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        animationController.repeat();
      });
    });
  }
}

class _ShaderPainter extends CustomPainter {
  AnimationController controller;
  _ShaderPainter({required this.shader,required this.controller}):super(repaint:controller );

  FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width/4);
    shader.setFloat(1, size.height/4);
    shader.setFloat(2, controller.value * 20);
    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

