import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/border/border_8/progress_border_button.dart';


class Border8Page extends StatefulWidget {
  const Border8Page({Key? key}) : super(key: key);
  @override
  _Border8PageState createState() => _Border8PageState();
}

class _Border8PageState extends State<Border8Page> {
  final int _duration = 10;
  late GlobalKey _progressButtonKey;

  @override
  void initState() {
    _progressButtonKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProgressBorderButton(
              key: _progressButtonKey,
              duration: _duration,
              size: const Size(200, 100),
              hasRadius: true,
              borderColor: const Color(0xFFFEDBFD),
              onTimeEnd: () {
                print('on time end');
              },
              childBuild: (context, double progress) {
                int remainTime = _duration - (_duration * progress).toInt();
                return Container(
                  width: 104,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  child: GestureDetector(
                    onTap: () {
                      print('tap button');
                    },
                    child: Container(
                      width: 94,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('images/btn_action.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFEDBFD), width: 3),
                        color: const Color(0xFFEEBAFF),
                      ),
                      child: Text('${max(remainTime, 0)}',
                          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _start() {
    ProgressBorderButtonState progressBorderButtonState = _progressButtonKey.currentState as ProgressBorderButtonState;
    progressBorderButtonState.start();
  }
}