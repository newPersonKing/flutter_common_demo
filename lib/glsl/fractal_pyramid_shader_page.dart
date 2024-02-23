import 'dart:ui';

import 'package:flutter/scheduler.dart';
import 'package:flutter_common_demo/generated/assets.dart';

import '../box_decoration/flutter_neumorphic.dart';

class FractalPyramidShaderPage extends StatefulWidget {
  const FractalPyramidShaderPage({super.key});

  @override
  State<FractalPyramidShaderPage> createState() => _FractalPyramidShaderPageState();
}

class _FractalPyramidShaderPageState extends State<FractalPyramidShaderPage>  {
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
      child: TickingBuilder(builder: (context,time){
        return  CustomPaint(
          size: const Size(400, 200),
          painter: ShaderPainter(  shader: shader! ,time: time),
        );
      }),
    );
  }

  void _loadShader() async {
    String path = 'shaders/fractal_pyramid.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {

    });
  }
}

class ShaderPainter extends CustomPainter {
  double time;
  ShaderPainter({required this.shader,required this.time});

  FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width/4);
    shader.setFloat(1, size.height/4);
    shader.setFloat(2, time);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class TickingBuilder extends StatefulWidget {
  const TickingBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, double time) builder;

  @override
  State<TickingBuilder> createState() => _TickingBuilderState();
}

class _TickingBuilderState extends State<TickingBuilder> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  double _time = 0.0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_handleTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _handleTick(Duration elapsed) {
    setState(() => _time = elapsed.inMilliseconds.toDouble() / 1000.0);
  }

  @override
  Widget build(BuildContext context) => widget.builder.call(context, _time);
}
