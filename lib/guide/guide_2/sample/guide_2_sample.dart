import 'package:flutter/material.dart';

import '../lib/flutter_intro.dart';
import 'advanced_usage.dart';
import 'demo_usage.dart';
import 'simple_usage.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Intro'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Intro(
                      padding: EdgeInsets.zero,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      maskColor: const Color.fromRGBO(0, 0, 0, .6),
                      child: const DemoUsage(),
                    ),
                  ),
                );
              },
              child: const Text('Demo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Intro(
                      buttonTextBuilder: (order) =>
                          order == 3 ? 'Custom Button Text' : 'Next',
                      child: const SimpleUsage(),
                    ),
                  ),
                );
              },
              child: const Text('Simple Usage'),
            ),
            ElevatedButton(
              child: const Text('Advanced Usage'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Intro(
                      maskClosable: true,
                      child: const AdvancedUsage(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
