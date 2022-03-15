

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

class PositionedNotificationNotifier extends SingleChildRenderObjectWidget {

  const PositionedNotificationNotifier({Key? key,Widget? child}) : super(key: key,child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {

    return _PositionedCallback(onLayoutChangedCallback: (offset){
      (PositionedNotification()..offset = offset).dispatch(context);
    });
  }
}

class _PositionedCallback extends RenderProxyBox {

  final Function(Offset) onLayoutChangedCallback;

  _PositionedCallback({
    RenderBox? child,
    required this.onLayoutChangedCallback,
  })  : super(child);

  Offset tmp = const Offset(0, 0);

  @override
  void performLayout() {
    super.performLayout();

    SchedulerBinding.instance?.addPostFrameCallback((time) { //第三处
      tmp = localToGlobal(Offset.zero);
      onLayoutChangedCallback(tmp);//第二处
    });
  }
}

class PositionedNotification extends Notification {
  Offset? offset;//位置信息
}
