import 'package:flutter/material.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/neumorphic_theme.dart';
import 'package:flutter_common_demo/box_decoration/src/top_bar.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/background.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/container.dart';

import 'Code.dart';
import 'ThemeConfigurator.dart';

class TipsBorderPage extends StatefulWidget {
  const TipsBorderPage({super.key});


  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<TipsBorderPage> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphicColors.accent,
        depth: 4,
        intensity: 0.6,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: const TopBar(
          title: "Border",
          actions: <Widget>[
            ThemeConfigurator(),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _CustomWidget(
                title: "Emboss Inside Flat",
                firstStyle: const NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  depth: 8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Convex",
                firstStyle: const NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  depth: 8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Concave",
                firstStyle: const NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  depth: 8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Flat Inside Emboss",
                firstStyle: const NeumorphicStyle(
                  depth: -8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.flat,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Emboss",
                firstStyle: const NeumorphicStyle(
                  depth: -8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.convex,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Emboss",
                firstStyle: const NeumorphicStyle(
                  depth: -8,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Convex",
                firstStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.convex,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Concave",
                firstStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.concave,
                ),
                secondStyle: const NeumorphicStyle(
                  depth: 8,
                  shape: NeumorphicShape.convex,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomWidget extends StatefulWidget {
  final String title;

  final NeumorphicStyle firstStyle;
  final NeumorphicStyle secondStyle;

  _CustomWidget(
      {required this.title,
      required this.firstStyle,
      required this.secondStyle});

  @override
  createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  String _describe(NeumorphicStyle style) {
    return "NeumorphicStyle(depth: ${style.depth}, oppositeShadowLightSource: ${style.oppositeShadowLightSource}, ...)";
  }

  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
      padding: EdgeInsets.all(20),
      boxShape: NeumorphicBoxShape.circle(),
      style: ${_describe(widget.firstStyle)},
      child: Neumorphic(
          boxShape: NeumorphicBoxShape.circle(),
          style: ${_describe(widget.secondStyle)},
          child: SizedBox(
            height: 100,
            width: 100,
          ),
      ),
    ),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context)),
                ),
              ),
              Neumorphic(
                padding: const EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: const NeumorphicBoxShape.circle(),
                ),
                child: Neumorphic(
                  style: widget.secondStyle.copyWith(
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  "opposite\nchild\nlightsource",
                  style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context)),
                ),
              ),
              Neumorphic(
                padding: const EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: const NeumorphicBoxShape.circle(),
                ),
                child: Neumorphic(
                  style: widget.secondStyle.copyWith(
                    boxShape: const NeumorphicBoxShape.circle(),
                    oppositeShadowLightSource: true,
                  ),
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        _buildCode(context),
      ],
    );
  }
}
