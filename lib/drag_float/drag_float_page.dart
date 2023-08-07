import 'package:flutter/material.dart';

class DragFloatPage extends StatefulWidget {

  const DragFloatPage({super.key});

  @override
  State<StatefulWidget> createState() => _DragFloatPageState();

}

class _DragFloatPageState extends State<DragFloatPage>{
  final _topVN = ValueNotifier(0.0);
  final _leftVN = ValueNotifier(0.0);
  Size? childSize;
  Size? parentSize;
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.amber,
        child: AnimatedBuilder(
          animation: Listenable.merge([_topVN,_leftVN]),
          builder: (context,child){
            return CustomSingleChildLayout(
              delegate: PolarLayoutDelegate((childSize){
                this.childSize = childSize;
              },(parentSize){
                this.parentSize = parentSize;
              },_topVN,_leftVN),
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails e){
                  if(childSize == null || parentSize == null)return;
                  var preTop = _topVN.value;
                  var preLeft = _leftVN.value;
                  var currentTop = preTop + e.delta.dy;
                  var currentLeft = preLeft + e.delta.dx;

                  if (currentTop <=0 ) {
                    _topVN.value = 0;
                    return;
                  }
                  // 左边
                  if (currentLeft < 0) {
                    _leftVN.value = 0;
                    return;
                  }
                  var maxWidth = parentSize!.width;
                  var maxHeight = parentSize!.height;
                  // 右边
                  if (currentTop > (maxHeight - childSize!.height)) {
                    _topVN.value = maxHeight - childSize!.height;
                    return;
                  }
                  // 下边
                  if (currentLeft > (maxWidth - childSize!.width)) {
                    _leftVN.value = maxWidth - childSize!.width;
                    return;
                  }
                  _topVN.value = currentTop;
                  _leftVN.value = currentLeft;
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: ColoredBox(
                    color: Colors.green,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}

class PolarLayoutDelegate extends SingleChildLayoutDelegate {

  final ValueNotifier<double> _topVN;
  final ValueNotifier<double> _leftVN;
  ValueChanged<Size> childSizeCallBack;
  ValueChanged<Size> parentSizeCallBack;
  PolarLayoutDelegate(this.childSizeCallBack,this.parentSizeCallBack,this._topVN,this._leftVN);
  @override
  bool shouldRelayout(covariant PolarLayoutDelegate oldDelegate) => true;

  //这个是获取自己的size
  @override
  Size getSize(BoxConstraints constraints) {
    //返回小边
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  //返回child的位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {

    childSizeCallBack(childSize);
    parentSizeCallBack(size);
    return  Offset(_leftVN.value, _topVN.value);
  }


  // constraints 父节点传递的约束
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //返回父节点的松约束 constraints.loosen()
    return constraints.loosen();
  }

}