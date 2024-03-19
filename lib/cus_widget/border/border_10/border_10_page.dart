

import 'package:flutter/material.dart';

import 'multi_border.dart';


class Border10Page extends StatelessWidget {
  const Border10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _examples.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, i) => Center(child: _examples[i]),
    );
  }

  List<Widget> get _examples => [
    _rectangleEvenBorders,
    _roundedRectangleEvenBorders,
    _roundedRectangleVaryingBorders,
    _circleVaryingBorders,
    _circleEvenBorders,
  ];

  List<Color> get _borderColors => const [
    Color(0xFFF14A42),
    Color(0xFFF27D3B),
    Color(0xFFF2A83A),
    Color(0xFFF8C43F),
  ];

  List<BorderSide> get _borderSides => const [
    BorderSide(color: Color(0xFFF14A42), width: 4),
    BorderSide(color: Color(0xFFF27D3B), width: 8),
    BorderSide(color: Color(0xFFF2A83A), width: 12),
    BorderSide(color: Color(0xFFF8C43F), width: 16),
  ];

  Container get _rectangleEvenBorders => Container(
    decoration: MultiBorderDecoration.evenBorders(
      width: 8,
      borderColors: _borderColors,
    ),
    child: _child,
  );

  Container get _roundedRectangleEvenBorders => Container(
    clipBehavior: Clip.hardEdge,
    decoration: MultiBorderDecoration.evenBorders(
      width: 8,
      innerRadius: BorderRadius.circular(8),
      borderColors: _borderColors,
    ),
    child: _child,
  );

  Container get _roundedRectangleVaryingBorders => Container(
    clipBehavior: Clip.hardEdge,
    decoration: MultiBorderDecoration(
      borderSides: _borderSides,
      innerRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    child: _child,
  );

  Container get _circleEvenBorders => Container(
    clipBehavior: Clip.antiAlias,
    decoration: MultiBorderDecoration.evenBorders(
      boxShape: BoxShape.circle,
      width: 8,
      borderColors: _borderColors,
    ),
    child: _child,
  );

  Container get _circleVaryingBorders => Container(
    clipBehavior: Clip.antiAlias,
    decoration: MultiBorderDecoration(
      boxShape: BoxShape.circle,
      borderSides: _borderSides,
    ),
    child: _child,
  );

  Container get _child => Container(
    width: 100,
    height: 100,
    color: const Color(0xFF4B3D2F),
    child: const Icon(Icons.thumb_up, color: Color(0xFFCEC1B6)),
  );
}