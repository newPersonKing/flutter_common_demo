import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_demo/generated/assets.dart';

import 'package:flutter/material.dart';
class ColorShaderDemo extends StatefulWidget {
  const ColorShaderDemo({super.key});

  @override
  State<ColorShaderDemo> createState() => _ColorShaderDemoState();
}

class _ColorShaderDemoState extends State<ColorShaderDemo>  {
  UI.FragmentShader? shader;
  UI.Image? image;
  @override
  void initState() {
    super.initState();
    _loadShader();
    loadImageFromAssets(Assets.imagesHome1);
  }

  //读取 assets 中的图片
  void loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    image = await decodeImageFromList(data.buffer.asUint8List());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    if (shader == null || image == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
      child: TickingBuilder(builder: (context,time){
        return  CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: ShaderPainter(  shader: shader! ,time: time,image: image!),
        );
      }),
    );
  }

  void _loadShader() async {
    String path = 'shaders/magic_test.glsl';
    UI.FragmentProgram program = await UI.FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {

    });
  }
}

class ShaderPainter extends CustomPainter {
  double time;
  UI.Image image;
  ShaderPainter({required this.shader,required this.time,required this.image});

  UI.FragmentShader shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, 80);
    shader.setFloat(1, 75);
    shader.setFloat(2, time);
    shader.setImageSampler(0, image);

    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, 300, 500),
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
