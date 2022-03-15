import 'package:flutter/material.dart';
import 'package:flutter_common_demo/listview/visibility_detector/visibility_detector_impl.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ListViewVisibilityDetector extends StatefulWidget {
  const ListViewVisibilityDetector({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListViewVisibilityDetectorState();
}

// 找到第一个可见item的index
class _ListViewVisibilityDetectorState extends State<ListViewVisibilityDetector> {
  @override
  Widget build(BuildContext context) {
    // 默认是500 可以设置 让更新的速度 加快
    VisibilityDetectorController.instance.updateInterval = const Duration(milliseconds: 10);
    var data = <int>[];
    for (var i = 0; i < 100; i++) {
      data.add(i);
    }
    int startIndex = 0;
    int endIndex = 0;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return VisibilityDetectorImpl(
              key:  Key("my-widget-key:$index"),
              index: index,
              visibleIndexChange: (visible,index){
                if(visible){
                  if(index < startIndex){
                    startIndex = index;
                  }

                  if(index > endIndex){
                     endIndex = index;
                  }
                }

                if(!visible){
                  if(index >= startIndex){
                    startIndex  = index + 1;
                  }

                  if(index <= endIndex){
                    endIndex = index - 1;
                  }
                }
                // todo 这里当结束滑动之后 能正确算出页面上的item
                print("startIndex===$startIndex==:endIndex==$endIndex");
              },
              child: Container(
                key: ValueKey(index),
                color: index % 2 == 0 ? Colors.red : Colors.yellow,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "$index",
                  style: const TextStyle(fontSize: 14),
                ),
              ));
        },
        itemCount: data.length,
      ),
    );
  }
}