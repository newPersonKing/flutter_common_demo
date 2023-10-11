import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/network/print.dart';

class PeopleCheckPage extends StatefulWidget {

  final double deviation; //偏差
  final double height;
  const PeopleCheckPage({super.key,this.deviation = 5,this.height = 300});

  @override
  State<StatefulWidget> createState() => PeopleCheckPageState();

}

class PeopleCheckPageState extends State<PeopleCheckPage>{

  /// 滑块的当前位置。
  double _sliderValue = 0.0;

  late double _offsetRate;

  /// 用于定位的偏移值。
  late double _offsetValue; //clipPath 偏移的位置


  /// 用于确保验证仅仅一次有效
  bool _verified = false;



  double _generateRandomNumber() {
    // 创建一个Random对象
    var random = Random();

    // 生成一个介于0.1和0.9之间的随机小数
    double randomValue = 0.1 + random.nextDouble() * 0.7;

    return randomValue;
  }
  @override
  void initState() {
    _offsetRate = _generateRandomNumber();
    super.initState();
  }

  Path buildClipPath(BoxConstraints constraints){
    var width = constraints.maxWidth;
    var height = constraints.maxHeight;
    var radius = 10.0;

    var pathWidth = width / 4;
    var pathHeight = height / 2;

    var centerWidth = pathWidth / 2;


    _offsetValue = _offsetRate * constraints.maxWidth;
    if(_offsetValue > width - pathWidth){
      _offsetValue = width - pathWidth;
    }
    if(_offsetValue < pathWidth){
      _offsetValue = pathWidth;
    }

    var yPosition = (height - pathHeight )/2;

    var realPath = Path();
    var clipPath = Path();
    clipPath.moveTo(0, 0);
    clipPath.lineTo(0 ,  pathHeight -  radius );
    clipPath.addArc(Rect.fromLTRB(0, pathHeight - 2 * radius , 2 * radius, pathHeight), - pi , -pi  /2,);
    clipPath.lineTo(pathWidth - radius,  pathHeight);
    clipPath.arcTo(Rect.fromLTRB(pathWidth - 2 * radius , pathHeight - 2 * radius, pathWidth, pathHeight),  pi / 2, -pi / 2,false);
    // clipPath.addArc(Rect.fromLTRB(pathWidth - 2 * radius , pathHeight - 2 * radius, pathWidth, pathHeight),  pi / 2, -pi / 2);
    clipPath.lineTo(pathWidth , pathHeight / 2 + centerWidth / 2);
    clipPath.lineTo(pathWidth - centerWidth , pathHeight / 2 + centerWidth / 2);
    clipPath.lineTo(pathWidth - centerWidth , pathHeight / 2 -  centerWidth / 2);
    clipPath.lineTo(pathWidth , pathHeight / 2 - centerWidth / 2);
    clipPath.lineTo(pathWidth, 0);
    clipPath.lineTo(0, 0);
    realPath.addPath(clipPath, Offset(_offsetValue, yPosition));
    return realPath;
  }

  double width = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 堆叠三层，背景图、裁剪的拼图、拼图的轮廓绘图
          SizedBox(
            height: widget.height,
            child: LayoutBuilder(builder: (context,constraints){
              var clipPath = buildClipPath(constraints);
              width = constraints.maxWidth;
              return Stack(
                alignment: Alignment.center,
                children: [
                  // 背景图层
                  Image.network(
                    "http://thispage.tech:9680/jclee1995/flutter-jc-captcha/-/raw/master/example/test_picture.png",
                    height: double.infinity,
                    fit: BoxFit.cover,
                    width: width,
                  ),
                  // 背景标记层
                  CustomPaint(
                    size: Size(width, double.infinity),
                    painter: ClipBorderPainter(0,clipPath),
                  ),
                  // 拼图层
                  Positioned(
                    left: _sliderValue * width - _offsetValue,
                    child: ClipPath(
                      clipper: CaptchaClipper(_sliderValue, 0,clipPath),
                      child: Image.network(
                        "http://thispage.tech:9680/jclee1995/flutter-jc-captcha/-/raw/master/example/test_picture.png",
                        height: widget.height,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 拼图的轮廓层
                  Positioned(
                    left: _sliderValue * width - _offsetValue,
                    child: CustomPaint(
                      size: Size(width, widget.height),
                      painter: CaptchaBorderPainter(0,clipPath),
                    ),
                  ),
                ],
              );
            }),
          ),
          //
          SliderTheme(
            data: SliderThemeData(
              thumbColor: Colors.white, // 滑块颜色为白色
              activeTrackColor: Colors.green[900], // 激活轨道颜色为深绿色
              inactiveTrackColor: Colors.green[900], // 非激活轨道颜色为深绿色
              trackHeight: 10.0, // 轨道高度
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 10.0), // 滑块形状为圆形
            ),
            child: Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              onChangeEnd: (value) {
                if (_verified == false) {
                  if (_sliderValue.abs() * width >
                      _offsetValue - widget.deviation &&
                      _sliderValue.abs() * width <
                          _offsetValue + widget.deviation) {
                    _verified = true;
                    printMsg("校验成功");
                  } else {
                    _verified = true;
                    printMsg("校验失败");
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }


}

class CaptchaClipper extends CustomClipper<Path> {
  final double sliderValue;
  final double offsetValue;
  final Path clipPath;

  /// 创建一个 [CaptchaClipper]，需要指定 [sliderValue] 和 [offsetValue]。
  CaptchaClipper(this.sliderValue, this.offsetValue,this.clipPath);

  @override
  Path getClip(Size size) {
    printMsg("getClip");
    final path = Path();
    path.addPath(clipPath, Offset(offsetValue, 0));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CaptchaBorderPainter extends CustomPainter {
  final double offsetValue;

  final Path clipPath;
  CaptchaBorderPainter(this.offsetValue,this.clipPath);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    var path  = Path();
    path.addPath(clipPath, Offset(offsetValue, 0));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ClipBorderPainter extends CustomPainter {
  final double offsetValue;

  final Path clipPath;
  ClipBorderPainter(this.offsetValue,this.clipPath);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;
    var path  = Path();
    path.addPath(clipPath, Offset(offsetValue, 0));
    canvas.drawPath(path, paint);
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

