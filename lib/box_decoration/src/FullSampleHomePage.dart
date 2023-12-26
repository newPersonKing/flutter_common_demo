import 'package:flutter/material.dart';
import 'package:flutter_common_demo/box_decoration/src/NeumorphicPlayground.dart';
import 'package:flutter_common_demo/box_decoration/src/NeumorphicTextPlayground.dart';
import 'package:flutter_common_demo/box_decoration/src/neumorphic_box_shape.dart';
import 'package:flutter_common_demo/box_decoration/src/sample_home.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/neumorphic_theme.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/theme.dart';
import 'package:flutter_common_demo/box_decoration/src/tips_home.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/button.dart';
import 'package:flutter_common_demo/box_decoration/src/widgets_home.dart';

import 'neumorphic_accessibility.dart';

class FullSampleHomePage extends StatelessWidget {

  const FullSampleHomePage({super.key});

  Widget _buildButton({required String text, required VoidCallback onClick}) {
    return NeumorphicButton(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        //border: NeumorphicBorder(
        //  isEnabled: true,
        //  width: 0.3,
        //),
        shape: NeumorphicShape.flat,
      ),
      child: Center(child: Text(text)),
      onPressed: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: const NeumorphicThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumorphicColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildButton(
                    text: "Neumorphic Playground",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const NeumorphicPlayground();
                      }));
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildButton(
                    text: "Text Playground",
                    onClick: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NeumorphicTextPlayground();
                      }));
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildButton(
                      text: "Samples",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const SamplesHome();
                        }));
                      }),
                  const SizedBox(height: 24),
                  _buildButton(
                      text: "Widgets",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const WidgetsHome();
                        }));
                      }),
                  const SizedBox(height: 24),
                  _buildButton(
                      text: "Tips",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const TipsHome();
                        }));
                      }),
                  const SizedBox(height: 24),
                  _buildButton(
                      text: "Accessibility",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const NeumorphicAccessibility();
                        }));
                      }),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}