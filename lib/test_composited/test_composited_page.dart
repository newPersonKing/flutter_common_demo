import 'dart:math';

import 'package:flutter/material.dart';

class TestCompositedPage extends StatefulWidget {

  const TestCompositedPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestCompositedPageState();

}

class _TestCompositedPageState extends State<TestCompositedPage>{

  final LayerLink layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // child: Center(
      //   child: Transform(transform: Matrix4.rotationZ(-15/180*pi), //一起旋转
      //     child: GestureDetector(
      //     onTap: _toggleOverlay,
      //     child: CompositedTransformTarget(
      //       link: layerLink,
      //       child: Container(
      //         width: 100,
      //         height: 100,
      //         color: Colors.green,
      //       ),
      //     ),
      //   ),),
      // ),
      child: Center(
        child: Transform(transform: Matrix4.diagonal3Values(0.5,0.5,1), //一起缩放
          child: GestureDetector(
            onTap: _toggleOverlay,
            child: CompositedTransformTarget(
              link: layerLink,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ),),
      ),
    );
  }

  void _toggleOverlay() {
    if (!show) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
    show = !show;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
  }

  OverlayEntry _createOverlayEntry() => OverlayEntry(
    builder: (BuildContext context) => UnconstrainedBox(
      child:  CompositedTransformFollower(
        link: layerLink,
        // followerAnchor: Alignment.bottomCenter, //调整follower相对target的位置
        // targetAnchor: Alignment.bottomCenter,
        // offset: Offset(0,50), 以上三个参数调整 位置
        child: Material(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(10),
              width: 80,
              height: 80,
              child: const Text("toly",style: TextStyle(color: Colors.white),)),
        ),
      ),
    ),
  );

}