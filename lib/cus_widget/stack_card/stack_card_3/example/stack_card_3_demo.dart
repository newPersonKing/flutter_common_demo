import 'package:flutter/material.dart';

import '../swipeable_card_stack.dart';
import 'card_view.dart';

class StackCard3Page extends StatefulWidget {
  const StackCard3Page({Key? key}) : super(key: key);
  @override
  _StackCard3PageState createState() => _StackCard3PageState();
}

class _StackCard3PageState extends State<StackCard3Page> {
  int counter = 4;

  @override
  Widget build(BuildContext context) {
    //create a CardController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            //add the first 3 cards
            items: const [
              CardView(text: "First card"),
              CardView(text: "Second card"),
              CardView(text: "Third card"),
            ],
            onCardSwiped: (dir, index, widget) {
              //Add the next card
              if (counter <= 20) {
                _cardController.addItem(CardView(text: "Card $counter"));
                counter++;
              }

              if (dir == Direction.left) {
                print('onDisliked ${(widget as CardView).text} $index');
              } else if (dir == Direction.right) {
                print('onLiked ${(widget as CardView).text} $index');
              } else if (dir == Direction.up) {
                print('onUp ${(widget as CardView).text} $index');
              } else if (dir == Direction.down) {
                print('onDown ${(widget as CardView).text} $index');
              }
            },
            enableSwipeUp: true,
            enableSwipeDown: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.chevron_left),
                  onPressed: () => _cardController.triggerSwipeLeft(),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.chevron_right),
                  onPressed: () => _cardController.triggerSwipeRight(),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.arrow_upward),
                  onPressed: () => _cardController.triggerSwipeUp(),
                ),
                FloatingActionButton(
                  child: const Icon(Icons.arrow_downward),
                  onPressed: () => _cardController.triggerSwipeDown(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
