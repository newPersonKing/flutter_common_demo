

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/border/border_1/animated_loading_border_widget.dart';
import 'package:flutter_common_demo/generated/assets.dart';

class Border1Demo extends StatelessWidget {
  const Border1Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: AnimatedLoadingBorder(
          isTrailingTransparent: false,
          borderColor: Colors.red,
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: 200,
            child: Image.asset(Assets.imagesHome1,width: 100),
          ),
        ),
      ),
    );
  }

}