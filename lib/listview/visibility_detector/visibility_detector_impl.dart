import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityDetectorImpl extends VisibilityDetector{

  final int index;
  final VisibleIndexChange? visibleIndexChange;

  VisibilityDetectorImpl({required Key key, required Widget child,required this.index,this.visibleIndexChange}) :
        super(key: key,child: child,onVisibilityChanged: (info){
            var visible = !info.visibleBounds.isEmpty;
            visibleIndexChange?.call(visible,index);
      });

}


typedef VisibleIndexChange = void Function(bool visible,int index);
