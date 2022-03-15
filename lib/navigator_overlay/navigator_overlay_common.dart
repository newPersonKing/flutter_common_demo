

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/navigator_overlay/overlay_simple.dart';

import '../main.dart';

class NavigatorOverlayCommonPage extends StatelessWidget {

  const NavigatorOverlayCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            commonItem("overLayToast",(){
              ToastUtil.show(context, "overlayToast");
            }),

          ],
        ),
      )),
    );
  }

}