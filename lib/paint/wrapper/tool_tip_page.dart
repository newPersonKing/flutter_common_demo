import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/paint/wrapper/wrapper.dart';

import 'popup_menu.dart' as CusPopMenuButtom;

class ToolTipPage extends StatelessWidget {
  const ToolTipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // PopupMenuButton 官方实现设置了最小宽度
              CusPopMenuButtom.PopupMenuButton<String>(
                  width: 80,
                  color: const Color(0xff7B5813),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onSelected: (item) {},
                  child: Container(
                    width: 80,
                    height: 21,
                    color: Colors.amberAccent,
                    child: const Text(
                      "主内容！！！！",
                      style: TextStyle(fontSize: 12, color: Colors.green),
                    ),
                  ),
                  itemBuilder: (context) {
                    // 可以通过只给第一个加wrapper 实现 箭头效果
                    return ['会员交易记录', '常见问题']
                        .map((e) => CusPopMenuButtom.PopupMenuItem<String>(
                        padding: EdgeInsets.zero,
                        child: Wrapper(
                          spineType: SpineType.top,
                          child: Container(
                            width: 80,
                            height: 73,
                            alignment: Alignment.center,
                            color: const Color(0xff7B5813),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFFFF8EB)),
                            ),
                          ),
                        )))
                        .toList();
                  }),
              CustomPaint(
                painter: PathPainter(),
                size: Size(200,200),
              ),
            ],
          )),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.addRRect(RRect.fromLTRBR(0, 0, size.width, size.height,const Radius.circular(20)));
    var pathList =  path.computeMetrics();
    var item = pathList.first;
    var firstPath = item.extractPath(0,item.length * 0.5);
    canvas.drawPath(firstPath, Paint()
      ..color = Colors.green
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
