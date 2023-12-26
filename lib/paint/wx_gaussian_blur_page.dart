

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WxGaussianBlurPage extends StatelessWidget {

  const WxGaussianBlurPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: buildCover(context),
    );
  }

  Widget buildCover(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double expandedHeight = 600;
    double closeHeight = 300;
    const String url =
        'https://img.alicdn.com/imgextra/i2/O1CN01YWcPh81fbUvpcjUXp_!!6000000004025-2-tps-842-350.png';
    return Container(
      height: expandedHeight,
      alignment: Alignment.center,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Image.network(url,
                fit: BoxFit.cover, height: expandedHeight, width: width),
          ),
          //图片是dest
          // todo 知识点 当颜色透明度为0 进行混合的时候 会被认为是没有元素
          Container(
            height: expandedHeight,
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.white,
                    Colors.transparent
                  ],
                  stops: [0.2,0.9,1]
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(url,
                  fit: BoxFit.cover, height: closeHeight, width: width),
            ),
          ),
        ],
      ),
    );
  }



}