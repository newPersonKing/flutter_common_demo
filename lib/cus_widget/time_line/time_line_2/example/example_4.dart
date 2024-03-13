import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_2/example/showcase_timeline.dart';
import 'package:flutter_common_demo/cus_widget/time_line/time_line_2/tile.dart';

const example4 = Example(
  name: 'Is it the first or the last?',
  description:
      'You can decide if a tile is the first or the last in a timeline. '
      'This way you control whether a start or end line must be rendered.',
  code: '''
return Container(
  color: Colors.white,
  child: TimelineTile(
    alignment: TimelineAlign.end,
    isFirst: true,
    startChild: Container(
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      color: Colors.amberAccent,
    ),
  ),
);''',
  childVertical: Example4Vertical(),
  childHorizontal: Example4Horizontal(),
);

class Example4Vertical extends StatelessWidget {
  const Example4Vertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            color: Colors.white,
            child: TimelineTile(
              alignment: TimelineAlign.end,
              isFirst: true,
              startChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                color: Colors.amberAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Example4Horizontal extends StatelessWidget {
  const Example4Horizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Row(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 100),
                color: Colors.white,
                child: TimelineTile(
                  axis: TimelineAxis.horizontal,
                  alignment: TimelineAlign.end,
                  isFirst: true,
                  startChild: Container(
                    constraints: const BoxConstraints(
                      minWidth: 120,
                    ),
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
