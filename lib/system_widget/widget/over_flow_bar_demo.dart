

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// OverflowBar
// 这个widget 可以用来做UI适配
// 1 比如有两个按钮，在大屏幕上展示一行，在小屏幕上展示两行
class OverflowBarDemo extends StatefulWidget {
  const OverflowBarDemo({super.key});

  @override
  State<StatefulWidget> createState() => _OverflowBarDemoState();

}

class _OverflowBarDemoState extends State<OverflowBarDemo>{
  // var _count = 4;
  // @override
  // Widget build(BuildContext context) {
  //
  //   return Material(
  //     child: Column(
  //       children: [
  //        Expanded(child:  OverflowBar(
  //          spacing: 10,
  //          alignment: MainAxisAlignment.center,
  //          overflowSpacing: 10,
  //          overflowAlignment: OverflowBarAlignment.center,
  //          overflowDirection: VerticalDirection.up,
  //          textDirection: TextDirection.ltr,
  //          clipBehavior: Clip.none,
  //          children: List.generate(
  //            _count,
  //                (index) => Container(
  //              width: 60,
  //              height: 60,
  //              color: Colors.primaries[index % Colors.primaries.length],
  //              alignment: Alignment.center,
  //              child: Text(
  //                index.toString(),
  //                style: const TextStyle(fontSize: 24, color: Colors.white),
  //              ),
  //            ),
  //          ).toList(),
  //        )),
  //         GestureDetector(
  //           onTap: (){
  //             setState(() {
  //               if(_count > 15){
  //                 _count--;
  //               }else {
  //                 _count ++;
  //               }
  //             });
  //           },
  //           child: Container(
  //             alignment: Alignment.center,
  //             height: 50,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               color: Colors.green,
  //               borderRadius: BorderRadius.circular(25)
  //             ),
  //             child: Text("add"),
  //           ),
  //         )
  //       ],
  //     )
  //     ,
  //   );
  // }

  var isSmall = false;
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        children: [
          SizedBox(
            width:  isSmall ? 150 : 300,
            child: OverflowBar(
              spacing: 10,
              alignment: MainAxisAlignment.center,
              overflowSpacing: 10,
              overflowAlignment: OverflowBarAlignment.center,
              overflowDirection: VerticalDirection.up,
              textDirection: TextDirection.ltr,
              clipBehavior: Clip.none,
              children: List.generate(
                2,
                    (index) => Container(
                  width: 100,
                  height: 60,
                  color: Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ).toList(),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              setState(() {
                isSmall = !isSmall;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Text("add"),
            ),
          )
        ],
      )
      ,
    );
  }

}