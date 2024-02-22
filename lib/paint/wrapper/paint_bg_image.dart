
import 'dart:async';
import 'dart:ui' as UI;
import 'package:flutter/material.dart';

class PaintBgPage extends StatelessWidget {

  const PaintBgPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Material(
      child: Center(
        child:  XHClipperImageContainer(
          width: 300,
          height: 300 * 4 / 3.0,
          x: 0,
          y: 1,
          ratio: 0.75,
          imageProvider: NetworkImage(
              "https://fb-cdn.fanbook.mobi/fanbook/app/files/chatroom/image/9a61840fbbcf766b15f8601b66b9d63c.jpeg"),
        ),
      ),
    );
  }
}

class XHClipperImageContainer extends StatefulWidget {
  final double width;
  final double height;
  final double x;
  final double y;
  final double ratio;
  final ImageProvider imageProvider;

  const XHClipperImageContainer({
    Key? key,
    required this.imageProvider,
    required this.width,
    required this.height,
    this.x = 0,
    this.y = 0,
    this.ratio = 0.75,
  }) : super(key: key);

  @override
  _XHClipperImageContainerState createState() =>
      _XHClipperImageContainerState();
}

/// 图片裁剪
class XHImageClipper extends CustomPainter {
  final UI.Image image;
  final double x;
  final double y;
  final double ratio;
  XHImageClipper(this.image, {this.x = 0.0, this.y = 0.0, this.ratio = 0.75});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final imgSourceWidth = image.width;
    final imgSourceHeight = image.height;

    Rect src = Rect.fromLTWH(
        0, 0, imgSourceWidth.toDouble(), imgSourceHeight.toDouble());

    //超长异形图 这里计算规则 根据自己的需求调整
    if (imgSourceHeight / imgSourceWidth > 3.0) {
      debugPrint("hh:超长异形图");
      final l = x * imgSourceWidth;
      final w = imgSourceWidth;
      final h = imgSourceWidth / ratio;
      double t = y * (imgSourceHeight - h);
      //l t 图片绘制的起点 相对于图片
      src = Rect.fromLTWH(l, t, w.toDouble(), h);
    }
    //超宽异形图
    if (imgSourceWidth / imgSourceHeight > 3.0) {
      debugPrint("hh:超宽异形图");
      double t = y * imgSourceHeight;
      final h = imgSourceHeight;
      final w = imgSourceWidth * ratio;
      double l = x * (imgSourceWidth - w);
      if (l + w > imgSourceWidth) l = 0;
      src = Rect.fromLTWH(l, t, w.toDouble(), h.toDouble());
    }

    canvas.drawImageRect(
        image, src, Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _XHClipperImageContainerState extends State<XHClipperImageContainer> {
  XHImageClipper? clipper;

  @override
  initState() {
    super.initState();
    _getImage();
  }

  Future<ImageInfo> getImageInfoByProvider(ImageProvider provider) {
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    bool flag = false;
    provider
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((info, _) {
      if (!flag) {
        completer.complete(info);
        flag = true;
      }
    }));
    return completer.future;
  }

  void _getImage() async {
    final imageInfo = await getImageInfoByProvider(widget.imageProvider);
    clipper = XHImageClipper(imageInfo.image,
        x: widget.x, y: widget.y, ratio: widget.ratio);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: clipper,
      size: Size(widget.width, widget.height),
    );
  }

  @override
  void dispose() {
    clipper = null;
    super.dispose();
  }
}


