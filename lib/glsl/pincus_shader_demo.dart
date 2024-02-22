import 'dart:ui' as UI;
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_common_demo/generated/assets.dart';

import '../box_decoration/flutter_neumorphic.dart';

class PincusShaderDemo extends StatefulWidget {
  const PincusShaderDemo({super.key});

  @override
  State<PincusShaderDemo> createState() => _PincusShaderDemoState();
}

class _PincusShaderDemoState extends State<PincusShaderDemo> {
  FragmentShader? shader;
  UI.Image? image;
  @override
  void initState() {
    super.initState();
    _loadShader();
    loadImageFromAssets(Assets.fashionFashion1);
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
      child: CustomPaint(
        size: const Size(500 * 0.8, 658 * 0.8),
        painter: ShaderPainter(  shader: shader!,image: image!),
      ),
    );
  }

  void _loadShader() async {
    String path = 'shaders/pincushion.glsl';
    FragmentProgram program = await FragmentProgram.fromAsset(path);
    shader = program.fragmentShader();
    setState(() {});
  }
}

class ShaderPainter extends CustomPainter {
  ShaderPainter({required this.shader,required this.image});

  FragmentShader shader;
  UI.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, 1);
    shader.setImageSampler(0, image);
    final paint = Paint()..shader = shader;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

