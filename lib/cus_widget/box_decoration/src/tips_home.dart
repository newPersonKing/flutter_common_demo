import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/theme/neumorphic_theme.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/theme/theme.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/tips_border.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/tips_emboss_inside_emboss.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/top_bar.dart';
import 'package:flutter_common_demo/cus_widget/box_decoration/src/widget/button.dart';

import 'neumorphic_box_shape.dart';

class TipsHome extends StatelessWidget {
  const TipsHome({super.key});

  Widget _buildButton({required String text, required VoidCallback onClick}) {
    return NeumorphicButton(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
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
                  const TopBar(title: "Tips", actions: [],),
                  _buildButton(
                      text: "Border",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const TipsBorderPage();
                        }));
                      }),
                  _buildButton(
                      text: "Recursive Emboss",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TipsRecursiveeEmbossPage();
                        }));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
