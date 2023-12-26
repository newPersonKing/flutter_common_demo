

import 'dart:async';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_common_demo/network/print.dart';

class DailyTracksCard extends StatefulWidget {
  const DailyTracksCard(
      {super.key,
        required this.width,
        required this.height,
        this.defaultTracksList});

  final double width;
  final double height;
  final List<String>? defaultTracksList;

  @override
  State<DailyTracksCard> createState() => _DailyTracksCardState();
}

class _DailyTracksCardState extends State<DailyTracksCard>  with SingleTickerProviderStateMixin{
  // 定时器
  late Timer timer;
  double currentY = 0;
  // 播放方向 false 为正向 true 为反向
  bool direction = false;
  late Future<ui.Image> image;

  late AnimationController animController;

  // 获取For You 每日推荐图片
  Future<ui.Image> loadDailyTracksImage(String path) async {
    final data = await NetworkAssetBundle(Uri.parse(path)).load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);
    return image;
  }

  @override
  void initState() {
    super.initState();
    animController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    // 随机从0到3的数，不包括3
    int index = Random().nextInt(3).toInt();
    image =
        loadDailyTracksImage(widget.defaultTracksList![index]).then((value) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            animController.animateTo(1);
          });
          return value;
        });

  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child:  SizedBox(
            width: widget.width,
            height: widget.height,
            child: FutureBuilder(
              future: image,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: DailyTracksCardPainter(
                            image: snapshot.data,
                            y: currentY.toDouble(),
                            listenable: animController
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 38,
                        left: 50,
                        child: Text(
                          "每日\n推荐",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 12,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 30,
                        child: IconButton(
                          style: ButtonStyle(
                            // 半透明背景
                            backgroundColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.15),
                            ),
                            overlayColor: MaterialStateProperty.all(
                              Colors.white.withOpacity(0.3),
                            ),
                          ),
                          // 播放按钮
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 60,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

// 画布类
class DailyTracksCardPainter extends CustomPainter {
  ui.Image? image;
  double x;
  double y;
  AnimationController listenable;
  DailyTracksCardPainter({this.image, this.x = 0, this.y = 0,required this.listenable}):super(repaint: listenable);

  final painter = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    double imageX = image!.width.toDouble();
    double imageY = image!.height.toDouble();
    // 要绘制的Rect，即原图片的大小

    var needSizeH =  (size.width / imageX) * imageY;
    // 要绘制成的Rect，即绘制后的图片大小
    if(needSizeH > size.height){
      Rect src = Rect.fromLTWH(0, (needSizeH - size.height) * listenable.value, imageX, size.height);
      //代表图片高度 大于 组件高度 可以移动
      printMsg("listenable.value===${(needSizeH - size.height) * listenable.value}");
      canvas.drawImageRect(
          image!,
          src,
          Rect.fromLTWH(0, 0, size.width,
              size.height),
          painter);
    }else {
      Rect src = Rect.fromLTWH(0, 0, imageX, imageY);
      //不移动
      canvas.drawImageRect(
          image!,
          src,
          Rect.fromLTWH(x, 0, size.width,
              needSizeH),
          painter);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

