import 'package:flutter/material.dart';
import 'package:flutter_common_demo/textfield/text_field_anim_label/textfield.dart';

/*
* floatingLabelBehavior 控制 label 的行为，有三个选项

FloatingLabelBehavior.auto 默认。正常状态覆盖 hint，focus 状态上浮。
FloatingLabelBehavior.always 正常状态 和 focus 状态 都上浮。hint 正常显示。
FloatingLabelBehavior.never 正常状态覆盖 hint，focus 状态不上浮。这时就和 hint 并不多了，唯一不同的是 focus 的时候 hint 不消失，label 消失。
* */

class TextFieldAnimLabelPage extends StatefulWidget {
  const TextFieldAnimLabelPage({super.key, required this.title});

  final String title;

  @override
  State<TextFieldAnimLabelPage> createState() => _TextFieldAnimLabelPageState();
}

class _TextFieldAnimLabelPageState extends State<TextFieldAnimLabelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Slide Animation",
                style: TextStyle(color: Colors.deepPurple),
              ),
              AnimatedTextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  animationType: Animationtype.slide,
                  hintTexts: const [
                    'Search for "Bengaluru"',
                    'Search for "Mumbai"',
                    'Search for "Chennai"',
                  ]),
              const Text(
                "\n\n\nFade Animation",
                style: TextStyle(color: Colors.deepPurple),
              ),
              AnimatedTextField(
                animationType: Animationtype.fade,
                hintTextStyle: const TextStyle(
                    color: Colors.deepPurple, overflow: TextOverflow.ellipsis),
                hintTexts: const [
                  'How is the weather today?',
                  'Will it rain today?',
                  'What is the temperature',
                ],
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const Text(
                "\n\n\n\nTyper Animation",
                style: TextStyle(color: Colors.deepPurple),
              ),
              AnimatedTextField(
                animationType: Animationtype.typer,
                hintTexts: const [
                  'Search "Flutter"',
                  'Search "Dart"',
                  'Search "Animated Hint TextField"',
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedTextField(
                hintTextStyle: const TextStyle(color: Colors.deepPurple),
                enabled: false,
                hintTexts: const [
                  'Pay friends and merchants',
                  'Pay by number or UPI ID',
                  'Pay by account number'
                ],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
