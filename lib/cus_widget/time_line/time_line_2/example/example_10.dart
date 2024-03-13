import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_2/example/showcase_timeline.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_2/tile.dart';

import '../style.dart';
import '../timeline_divider.dart';

const example10 = Example(
  name: 'Connect tiles with TimelineDivider.',
  description:
      'The TimelineDivider widget allows you to connect tiles that are aligned '
      'in different horizontal or vertical axis, when combined with TimelineAlign.manual.',
  code: '''
return Container(
  color: Colors.white,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: true,
        indicatorStyle: const IndicatorStyle(
          width: 20,
          color: Colors.purple,
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.purple,
          thickness: 6,
        ),
      ),
      const TimelineDivider(
        begin: 0.1,
        end: 0.9,
        thickness: 6,
        color: Colors.purple,
      ),
      TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.9,
        beforeLineStyle: const LineStyle(
          color: Colors.purple,
          thickness: 6,
        ),
        afterLineStyle: const LineStyle(
          color: Colors.deepOrange,
          thickness: 6,
        ),
        indicatorStyle: const IndicatorStyle(
          width: 20,
          color: Colors.cyan,
        ),
      ),
      const TimelineDivider(
        begin: 0.1,
        end: 0.9,
        thickness: 6,
        color: Colors.deepOrange,
      ),
      TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isLast: true,
        beforeLineStyle: const LineStyle(
          color: Colors.deepOrange,
          thickness: 6,
        ),
        indicatorStyle: const IndicatorStyle(
          width: 20,
          color: Colors.red,
        ),
      ),
    ],
  ),
);''',
  childVertical: Example10Vertical(),
  childHorizontal: Example10Horizontal(),
);

class Example10Vertical extends StatelessWidget {
  const Example10Vertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            color: Colors.white,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.purple,
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                ),
                TimelineDivider(
                  begin: 0.1,
                  end: 0.9,
                  thickness: 6,
                  color: Colors.purple,
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.9,
                  beforeLineStyle: LineStyle(
                    color: Colors.purple,
                    thickness: 6,
                  ),
                  afterLineStyle: LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.cyan,
                  ),
                ),
                TimelineDivider(
                  begin: 0.1,
                  end: 0.9,
                  thickness: 6,
                  color: Colors.deepOrange,
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.1,
                  isLast: true,
                  beforeLineStyle: LineStyle(
                    color: Colors.deepOrange,
                    thickness: 6,
                  ),
                  indicatorStyle: IndicatorStyle(
                    width: 20,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Example10Horizontal extends StatelessWidget {
  const Example10Horizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Center(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 120),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  const TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    indicatorStyle: IndicatorStyle(
                      height: 20,
                      color: Colors.purple,
                    ),
                    beforeLineStyle: LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.purple,
                  ),
                  const TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.9,
                    beforeLineStyle: LineStyle(
                      color: Colors.purple,
                      thickness: 6,
                    ),
                    afterLineStyle: LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      height: 20,
                      color: Colors.cyan,
                    ),
                  ),
                  const TimelineDivider(
                    axis: TimelineAxis.vertical,
                    begin: 0.1,
                    end: 0.9,
                    thickness: 6,
                    color: Colors.deepOrange,
                  ),
                  const TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isLast: true,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepOrange,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
