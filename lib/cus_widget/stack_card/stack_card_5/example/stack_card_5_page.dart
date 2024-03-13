
import 'package:flutter/material.dart';

import '../cards.dart';
import '../controller.dart';

List<Color> colors = [
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.amber,
  Colors.cyan,
  Colors.purple,
  Colors.brown,
  Colors.teal,
];

List<Widget> cards = List.generate(
  colors.length,
  (int index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors[index],
      ),
      child: Text(
        '${index + 1}',
        style: TextStyle(fontSize: 100.0, color: Colors.white),
      ),
    );
  },
);

class TCardPage extends StatefulWidget {
  const TCardPage({super.key});

  @override
  _TCardPageState createState() => _TCardPageState();
}

class _TCardPageState extends State<TCardPage> {
  final TCardController _controller = TCardController();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            TCard(
              cards: cards,
              rightIcon: const Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 32,
              ),
              controller: _controller,
              onForward: (index, info) {
                // you can load more cards from you server
                var offset = 3;
                if (index >= cards.length - offset) {
                  print('loading more...');
                  List<Widget> addCards = List.generate(
                    colors.length,
                    (int index2) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colors[index2],
                        ),
                        child: Text(
                          '${index2 + 1}',
                          style:
                              TextStyle(fontSize: 100.0, color: Colors.white),
                        ),
                      );
                    },
                  ).toList();
                  setState(() {
                    cards.addAll(addCards);
                  });
                  _controller.append(addCards);
                }
                _index = index;
                print(info.direction);
                setState(() {});
              },
              onBack: (index, info) {
                _index = index;
                setState(() {});
              },
              onEnd: () {
                print('end');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(_index.toString()),
      ),
    );
  }
}
