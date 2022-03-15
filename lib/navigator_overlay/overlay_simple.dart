
import 'package:flutter/material.dart';

class ToastUtil{
  static  ToastView? toastView;
  static show(BuildContext context,String msg){
    toastView?._dissmiss();

    var overlayState = Overlay.of(context);

    if(overlayState == null) return;
    /*给overlayState添加动画 */
    var controllerShowAnim = AnimationController(vsync: overlayState,duration: const Duration(milliseconds: 350));
    var controllerShowOffset = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 350),
    );
    var controllerHide = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 250),
    );

    var opacityAnim1 = Tween(begin: 0.0,end: 1.0).animate(controllerShowAnim);
    var offsetAnim = Tween(begin: 30.0,end: 0.0).animate(controllerShowOffset);
    var opacityAnim2 = Tween(begin: 1.0, end: 0.0).animate(controllerHide);

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context){
          return ToastWidget(
            buildToastLayout(msg),
            offsetAnim,
            opacityAnim1,
            opacityAnim2,
          );
        });
    toastView = ToastView(overlayEntry,overlayState,controllerShowAnim,controllerShowOffset,controllerHide);
    toastView?._show();
  }

  /*构建要显示的toast的view*/
  static LayoutBuilder buildToastLayout(String msg){
    return LayoutBuilder(builder: (context,constraints){

      return IgnorePointer(
        ignoring: true,
        child: Container(
          child: Material(
            color: Colors.white.withOpacity(0),
            child: Container(
              child: Container(
                child: Text(msg,
                  style: const TextStyle(color: Colors.red),),
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.6),
                    borderRadius: const BorderRadius.all(Radius.circular(5))
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              margin: EdgeInsets.only(
                bottom: constraints.biggest.height * 0.15,
                left: constraints.biggest.width * 0.2,
                right: constraints.biggest.width * 0.2,
              ),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    });
  }
}

class ToastWidget extends StatelessWidget {

  final Widget child;
  final Animation<double> opacityAnim1;
  final Animation<double> opacityAnim2;
  final Animation<double> offsetAnim;

  const ToastWidget(this.child, this.offsetAnim, this.opacityAnim1, this.opacityAnim2,{Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
        animation: opacityAnim1,
        child: child,
        builder:(context,child){
          return Opacity(
            opacity: opacityAnim1.value,
            child:AnimatedBuilder(
                animation: offsetAnim,
                builder: (context,_){
                  return Transform.translate(
                    offset: Offset(0, offsetAnim.value),
                    child: AnimatedBuilder(
                        animation: opacityAnim2,
                        builder: (context,_){
                          return Opacity(
                            opacity: opacityAnim2.value,
                            child: child,
                          );
                        }),);
                }) ,);
        });
  }

}

class ToastView{

  OverlayEntry overlayEntry;
  OverlayState overlayState;

  AnimationController controllerShowAnim;
  AnimationController controllerShowOffset;
  AnimationController controllerHide;

  ToastView(this.overlayEntry,this.overlayState,this.controllerShowAnim,this.controllerShowOffset,this.controllerHide);

  bool dissMissed = false;

  /*显示 延迟3.5秒 消失*/
  _show() async{
    overlayState.insert(overlayEntry);
    controllerShowAnim.forward();
    controllerShowOffset.forward();
    await Future.delayed(const Duration(seconds: 3));
    _dissmiss();
  }

  /*消失*/
  _dissmiss() async{
    if(dissMissed){
      return;
    }
    controllerHide.forward();
    dissMissed = true;
    await Future.delayed(const Duration(milliseconds: 250));
    overlayEntry.remove();
  }
}