import 'package:flutter/material.dart';

import 'bordered_text.dart';

class Border4Page extends StatefulWidget {
  const Border4Page({super.key});
  @override
  Border4PageState createState() => Border4PageState();
}

class Border4PageState extends State<Border4Page> {
  final String title = 'Bordered Text Example';
  final String message = 'M';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BorderedText(
              strokeWidth: 4.0,
              strokeColor: Colors.red,
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            BorderedText(
              strokeWidth: 4.0,
              strokeColor: Colors.green,
              child: const Text(
                'Bold Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            BorderedText(
              strokeWidth: 4.0,
              strokeColor: Colors.blue,
              child: const Text(
                'Bold Italicised Text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}