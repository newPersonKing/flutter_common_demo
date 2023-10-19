

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common_demo/network/print.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatListViewPage4 extends StatefulWidget {
  const ChatListViewPage4({super.key});

  @override
  State<StatefulWidget> createState() => _ChatListViewPage4State();

}

class _ChatListViewPage4State extends State<ChatListViewPage4>{
  List<String> data =  ["1","2","3"];
  ScrollController scrollController = ScrollController();
  BuildContext? sliverContext;
  var offsetRecord = OffsetRecord();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              physics:  const AlwaysScrollableScrollPhysics().applyTo(ChatObserverClampingScrollPhysics(offsetRecord: offsetRecord)),
              itemBuilder: (context,index){
                sliverContext ??= context;
                return Container(height: 100,width: double.infinity,color: Colors.yellow,child: Text(data[index]),);
              },
              itemCount: data.length)),
          GestureDetector(
            onTap: (){
              offsetRecord.standBy(sliverContext);
              setState(() {
                data.insert(0, "${data.length}");
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  printMsg("position===${scrollController.position.maxScrollExtent}");
                });
              });
            },
            child:  Container(height: 100,width: double.infinity,color: Colors.yellow,),
          )
        ],
      ),
    );
  }

}


class ChatObserverClampingScrollPhysics extends ClampingScrollPhysics with ChatObserverScrollPhysicsMixin{

  ChatObserverClampingScrollPhysics({
    ScrollPhysics? parent,
    required OffsetRecord offsetRecord,
  }) : super(parent: parent) {
    this.offsetRecord = offsetRecord;
  }

  @override
  ChatObserverClampingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return ChatObserverClampingScrollPhysics(
      parent: buildParent(ancestor),
      offsetRecord: offsetRecord,
    );
  }
}

mixin ChatObserverScrollPhysicsMixin on ScrollPhysics {

  late OffsetRecord offsetRecord;
  @override
  double adjustPositionForNewDimensions({required ScrollMetrics oldPosition, required ScrollMetrics newPosition, required bool isScrolling, required double velocity}) {
    var adjustPosition = super.adjustPositionForNewDimensions(
      oldPosition: oldPosition,
      newPosition: newPosition,
      isScrolling: isScrolling,
      velocity: velocity,
    );
    offsetRecord.findAfterOffset();
    return adjustPosition + offsetRecord.afterOffset - offsetRecord.preOffset;
  }


}

class OffsetRecord{
  num preOffset = 0;
  num afterOffset = 0;
  var preIndex = 0;
  var afterIndex = 0;
  BuildContext? sliverContext;

  void standBy(BuildContext? sliverContext){
    this.sliverContext = sliverContext;
    if(sliverContext != null){
      var obj = sliverContext.findRenderObject();
      if(obj == null)return;
      if (obj is! RenderSliverMultiBoxAdaptor) return;
      var firstChild = findCurrentFirstChild(obj);
      if(firstChild == null)return;
      //找到第一个渲染的child的index
      var index = firstChild.index;
      preIndex = index;
      afterIndex = preIndex + 1;
      var parentData = firstChild.parentData;
      var layoutOffset =  parentData is! SliverLogicalParentData ? 0 : parentData.layoutOffset;
      preOffset = layoutOffset ?? 0;
    }
  }

  void findAfterOffset(){
    findChildInfoWithIndex(index :afterIndex,sliverContext:sliverContext);
  }

  void findChildInfoWithIndex({
    required int index,
    BuildContext? sliverContext,
  }) {
    var obj = sliverContext?.findRenderObject();
    if (obj is! RenderSliverMultiBoxAdaptor) return;
    final viewport = findViewport(obj);
    if (viewport == null) return;
    var targetChild = findCurrentFirstChild(obj);
    if (targetChild == null) return;
    while (targetChild != null && (targetChild.index != index)) {
      targetChild = findNextChild(obj: obj, currentChild: targetChild);
    }
    if (targetChild == null) return;
    var parentData = targetChild.parentData;
    var layoutOffset =  parentData is! SliverLogicalParentData ? 0 : parentData.layoutOffset;
    afterOffset = layoutOffset ?? 0;
  }

  RenderIndexedSemantics? findNextChild({
    required RenderSliverMultiBoxAdaptor obj,
    RenderBox? currentChild,
  }) {
    RenderIndexedSemantics? child;
    if (currentChild == null) return null;
    var nextChild = obj.childAfter(currentChild);
    if (nextChild == null) return null;
    if (nextChild is RenderIndexedSemantics) {
      child = nextChild;
    } else {
      nextChild = obj.childAfter(nextChild);
      if (nextChild is RenderIndexedSemantics) {
        child = nextChild;
      }
    }
    return child;
  }

  RenderViewportBase? findViewport(RenderObject obj) {
    int maxCycleCount = 10;
    int currentCycleCount = 1;
    // Starting from flutter version 3.13.0, the type of parent received
    // is RenderObject, while the type of the previous version is AbstractNode,
    // but RenderObject is a subclass of AbstractNode, so for compatibility,
    // we can use RenderObject.
    var parent = obj.parent;
    if (parent is! RenderObject) {
      return null;
    }
    while (parent != null && currentCycleCount <= maxCycleCount) {
      if (parent is RenderViewportBase) {
        return parent;
      }
      parent = parent.parent;
      currentCycleCount++;
    }
    return null;
  }

  RenderIndexedSemantics? findCurrentFirstChild(
      RenderSliverMultiBoxAdaptor obj,
      ) {
    RenderIndexedSemantics? child;
    final firstChild = obj.firstChild;
    if (firstChild == null) return null;
    if (firstChild is RenderIndexedSemantics) {
      child = firstChild;
    } else {
      final nextChild = obj.childAfter(firstChild);
      if (nextChild is RenderIndexedSemantics) {
        child = nextChild;
      }
    }
    return child;
  }
}