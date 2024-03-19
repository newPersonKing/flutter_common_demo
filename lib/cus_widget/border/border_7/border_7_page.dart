
import 'package:flutter/material.dart';

import 'glowy_borders.dart';

class Border7Page extends StatelessWidget {
  const Border7Page({super.key});


  @override
  Widget build(BuildContext context) {

    final widget = Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [Text('Hallo Welt')],
              ),
              AnimatedGradientBorder(
                borderSize: 2,
                glowSize: 10,
                gradientColors: const [
                  Colors.red,
                  Colors.red,
                  Colors.green,
                  Colors.green
                ],
                animationProgress: 1,
                borderRadius: const BorderRadius.all(Radius.circular(999)),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(999)),
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondaryContainer),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("current value: $currentProgress",
                        //     style: TextStyle(color: Colors.white, fontSize: 30.0)),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedGradientBorder(
                borderSize: 2,
                glowSize: 10,
                gradientColors: const [
                  Colors.red,
                  Colors.red,
                  Colors.green,
                  Colors.green
                ],
                // animationProgress: 1,
                borderRadius: const BorderRadius.all(Radius.circular(999)),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(999)),
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondaryContainer),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text("current value: $currentProgress",
                        //     style: TextStyle(color: Colors.white, fontSize: 30.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Material(
      color: Colors.white,
      child: widget,
    );
  }

}