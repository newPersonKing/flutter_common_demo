

import 'dart:ui';
import 'package:flutter/material.dart';

class BackdropFilterPage extends StatefulWidget {

  const BackdropFilterPage({super.key});

  @override
  State<StatefulWidget> createState() => _BackdropFilterPageState();

}

class _BackdropFilterPageState extends State<BackdropFilterPage>{

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: _buildBackCover(),
    );
  }

  Widget _buildBackCover() {
    return Container(
      //整体渐变色
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF677897),
                Color(0xFF6C6D97),
              ])),
      child: Stack(
        children: [
          //色块1
          Positioned(
            top: 26,
            right: 63,
            child: Container(
              height: 130,
              width: 130,
              decoration: const BoxDecoration(
                  color: Color(0xFF9A8AA7),
                  borderRadius: BorderRadius.all(Radius.circular(65))),
            ),
          ),
          //色块2
          Positioned(
            top: 117,
            left: -35,
            child: Container(
              height: 130,
              width: 130,
              decoration: const BoxDecoration(
                  color: Color(0xFFA7948A),
                  borderRadius: BorderRadius.all(Radius.circular(65))),
            ),
          ),
          //色块3
          Positioned(
            top: 52,
            right: -14,
            child: Container(
              height: 130,
              width: 130,
              decoration: const BoxDecoration(
                  color: Color(0xFF505EB4),
                  borderRadius: BorderRadius.all(Radius.circular(65))),
            ),
          ),
          //覆盖的模糊效果
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              color: Colors.white.withAlpha(0),
            ),
          )
        ],
      ),
    );
  }


}