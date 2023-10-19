


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextShadowDemo extends StatelessWidget {

  const TextShadowDemo({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(
        child: Text(
          'Hello, world!',
          style: TextStyle(
            fontSize: 50,
            color: Colors.pink,
            fontWeight: FontWeight.w900,
            shadows: <Shadow>[
              const Shadow(
                offset: Offset(4.0, 4.0),
                blurRadius: 3.0,
                color: Color.fromARGB(99, 64, 64, 64),
              ),
              Shadow(
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.grey.shade100),
            ],
          ),
        ),
      )
    );
  }

}