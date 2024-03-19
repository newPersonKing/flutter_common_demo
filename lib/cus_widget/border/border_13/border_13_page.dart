import 'package:flutter/material.dart';

import 'box_borders/gradient_box_border.dart';
import 'input_borders/gradient_outline_input_border.dart';


class Border13Page extends StatefulWidget {
  const Border13Page({Key? key}) : super(key: key);

  @override
  State<Border13Page> createState() => _Border13PageState();
}

class _Border13PageState extends State<Border13Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gradient borders"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(16)),
            ),
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                border: GradientBoxBorder(
                  gradient:
                  LinearGradient(colors: [Colors.green, Colors.yellow]),
                  width: 4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: GradientBoxBorder(
                  gradient:
                  LinearGradient(colors: [Colors.pink, Colors.orange]),
                  width: 4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                  width: 2,
                ),
                focusedBorder: GradientOutlineInputBorder(
                    gradient:
                    LinearGradient(colors: [Colors.yellow, Colors.green]),
                    width: 2),
                label: Text("Example"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
