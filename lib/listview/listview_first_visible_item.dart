

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

// 这种方式只能处理 cacheExtent 为0 的情况
class ListViewFirstVisibleItem extends StatefulWidget {
  const ListViewFirstVisibleItem({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewFirstVisibleItemState();
}

// 找到第一个可见item的index
class _ListViewFirstVisibleItemState extends State<ListViewFirstVisibleItem> {
  @override
  Widget build(BuildContext context) {
    var data = <int>[];
    for (var i = 0; i < 100; i++) {
      data.add(i);
    }
    return Scaffold(
      body: ListView.custom(
          padding: EdgeInsets.zero,
          cacheExtent: 0, // 这个是指为0  不然最后一个不正确
          childrenDelegate: CustomDelete(
                  (context, index) {
                return index == 1 ? VisibilityDetector(
                    onVisibilityChanged: (info){
                      print("cccccccccc"+info.toString());
                    },
                    key: const Key('my-widget-key'),
                    child: Container(
                  key: ValueKey(index),
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "$index",
                    style: const TextStyle(fontSize: 14),
                  ),
                ) ): Container(
                  key: ValueKey(index),
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "$index",
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
              childCount: data.length)),
    );
  }
}

class CustomDelete extends SliverChildBuilderDelegate {
  const CustomDelete(
    NullableIndexedWidgetBuilder builder, {
    ChildIndexGetter? findChildIndexCallback,
    int? childCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    int semanticIndexOffset = 0,
  }) : super(builder,
            findChildIndexCallback: findChildIndexCallback,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            semanticIndexOffset: semanticIndexOffset);

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    super.didFinishLayout(firstIndex, lastIndex);
    print("ccccccc====firstIndex:$firstIndex;lastIndex;$lastIndex");
  }

}
