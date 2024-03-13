

import 'dart:math';

import 'package:flutter/cupertino.dart';

typedef BuildWithIndex = Widget Function(int index);

class StackView extends StatefulWidget {
  final BuildWithIndex buildWithIndex;
  const StackView({super.key,required this.buildWithIndex});
  @override
  State<StatefulWidget> createState() => _StackViewState();

}

class _StackViewState extends State<StackView> with SingleTickerProviderStateMixin{

  var topIndex = 0;
  late AnimationController animController;
  double startX = 0.0;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(vsync: this,
        value: 0,
        duration: const Duration(seconds: 1),
        lowerBound: -1);
    animController.addListener(() {
      debugPrint("=======addListener===${animController.status}");
      if(animController.status == AnimationStatus.completed || animController.status == AnimationStatus.dismissed){
        if(animController.value.abs() == 1){
          topIndex ++;
          animController.value = 0;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,cons){
      var width = cons.maxWidth;
      return GestureDetector(
        onPanDown: (detail){
          startX = detail.localPosition.dx;
        },
        onPanUpdate: (detail){
          setState(() {
            var dragX = (detail.localPosition.dx - startX);
            animController.value = dragX / width ;
          });
        },
        onPanEnd: (detail){
          var animValue = animController.value;
          if(animValue > 0.3){
            debugPrint("=====addListener=====3");
            animController.forward();
          }else if(animValue < -0.3){
            animController.reverse();
            debugPrint("=====addListener=====2");
          }else {
            debugPrint("=====addListener=====1");
            animController.animateTo(0);
          }
        },
        child: SizedBox(
          width: width,
          child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  AnimatedBuilder(animation: animController, builder: (context,child){
                    return Transform.scale(
                      scale: 0.7 + (animController.value.abs()) * 0.2,
                      child:  widget.buildWithIndex.call(topIndex + 2),
                    );
                  }),
                  AnimatedBuilder(animation: animController, builder: (context,child){
                    return Transform.scale(
                      scale: 0.8 + (animController.value.abs()) * 0.2,
                      child:  widget.buildWithIndex.call(topIndex + 1),
                    );
                  }),
                  AnimatedBuilder(animation: animController, builder: (context,child){
                    return Transform.translate(offset: Offset(width * animController.value, 0),
                      // child: Transform.rotate(angle: pi / 2 * animController.value,
                      //     child: widget.buildWithIndex.call(topIndex),
                      //   alignment: animController.value > 0 ? Alignment.bottomRight : Alignment.bottomLeft,
                      // )
                      child: Transform.scale(
                        scale: 1 - animController.value.abs(),
                        child: Opacity(opacity: 1 - animController.value.abs(),
                            child:  widget.buildWithIndex.call(topIndex)),
                      ),
                    );
                  }),
                ],
              )
          ),
        ),
      );
    });
  }

}