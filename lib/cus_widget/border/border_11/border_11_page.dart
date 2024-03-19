import 'package:flutter/material.dart';

import 'demo_grid.dart';


class Border11Page extends StatelessWidget {
  const Border11Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      appBar: AppBar(title: const Text('Corner Decoration Demo')),
      body: const DemoGrid(),
    );
  }
}
