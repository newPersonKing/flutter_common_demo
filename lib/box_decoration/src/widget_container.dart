import 'package:flutter/material.dart';
import 'package:flutter_common_demo/box_decoration/src/Code.dart';
import 'package:flutter_common_demo/box_decoration/src/color_selector.dart';
import 'package:flutter_common_demo/box_decoration/src/theme/neumorphic_theme.dart';
import 'package:flutter_common_demo/box_decoration/src/top_bar.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/background.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/button.dart';
import 'package:flutter_common_demo/box_decoration/src/widget/container.dart';

import 'ThemeConfigurator.dart';

class ContainerWidgetPage extends StatefulWidget {
  const ContainerWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<ContainerWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumorphicColors.accent,
        depth: 8,
        intensity: 0.5,
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
          title: "Container",
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
              _DefaultWidget(),
              _CircleWidget(),
              _RoundRectWidget(),
              _ColorizableWidget(),
              _FlatConcaveConvexWidget(),
              _EmbossWidget(),
              _DrawAboveWidget(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefaultWidget extends StatefulWidget {
  @override
  createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<_DefaultWidget> {
  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    child: SizedBox(
        height: 100,
        width: 100,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Default",
            style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          const Neumorphic(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 12),
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

class _CircleWidget extends StatefulWidget {
  @override
  createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<_CircleWidget> {
  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
     boxShape: NeumorphicBoxShape.circle(),
     padding: EdgeInsets.all(18.0),
     child: Icon(Icons.map),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Circle",
            style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          const Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
            ),
            padding: EdgeInsets.all(18.0),
            child: Icon(Icons.map),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  @override
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

class _RoundRectWidget extends StatefulWidget {
  @override
  createState() => _RoundRectWidgetState();
}

class _RoundRectWidgetState extends State<_RoundRectWidget> {
  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    style: NeumorphicStyle(
         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
    ),
    padding: EdgeInsets.all(18.0),
    child: Icon(Icons.map),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "RoundRect",
            style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: EdgeInsets.all(18.0),
            child: Icon(Icons.map),
          ),
          SizedBox(width: 12),
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

class _ColorizableWidget extends StatefulWidget {
  @override
  createState() => _ColorizableWidgetState();
}

class _ColorizableWidgetState extends State<_ColorizableWidget> {
  Color currentColor = Colors.white;

  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    style: NeumorphicStyle(
        color: Colors.white,
        boxShape: NeumorphicBoxShape.circle()
    ),
    child: SizedBox(
      height: 100, 
      width: 100,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Color",
            style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
          ),
          SizedBox(width: 12),
          ColorSelector(
            color: currentColor,
            onColorChanged: (color) {
              setState(() {
                currentColor = color;
              });
            },
          ),
          const SizedBox(width: 12),
          Neumorphic(
            style: NeumorphicStyle(
                color: currentColor, boxShape: const NeumorphicBoxShape.circle()),
            child: const SizedBox(
              height: 100,
              width: 100,
            ),
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

class _FlatConcaveConvexWidget extends StatefulWidget {
  @override
  createState() => _FlatConcaveConvexWidgetState();
}

class _FlatConcaveConvexWidgetState extends State<_FlatConcaveConvexWidget> {
  bool isChecked = false;

  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    style: NeumorphicStyle(
         shape: NeumorphicShape.flat 
         //or convex, concave
    ),
    
    child: ...
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  "Flat",
                  style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  "Concave",
                  style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Convex",
                  style: TextStyle(
                      color: NeumorphicTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const NeumorphicButton(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.circle()),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
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

class _EmbossWidget extends StatefulWidget {
  @override
  createState() => _EmbossWidgetState();
}

class _EmbossWidgetState extends State<_EmbossWidget> {
  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    child: Icon(Icons.play_arrow),
    style: NeumorphicStyle(
      depth: -10.0,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Text(
                "Emboss",
                style:
                    TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
              ),
              const SizedBox(width: 12),
              const Neumorphic(
                padding: EdgeInsets.all(18),
                child: Icon(Icons.play_arrow),
                style: NeumorphicStyle(
                  depth: -10.0,
                ),
              ),
              const SizedBox(width: 12),
              const Neumorphic(
                padding: EdgeInsets.all(18),
                child: Icon(Icons.play_arrow),
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: -10.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
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

class _DrawAboveWidget extends StatefulWidget {
  @override
  createState() => _DrawAboveWidgetState();
}

class _DrawAboveWidgetState extends State<_DrawAboveWidget> {
  Widget _buildCode(BuildContext context) {
    return Code("""
Neumorphic(
    child: ...,
    drawSurfaceAboveChild: true,
    style: NeumorphicStyle(
        surfaceIntensity: 1,
        shape: NeumorphicShape.concave,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Text(
            "DrawAbove",
            style: TextStyle(color: NeumorphicTheme.defaultTextColor(context)),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("false")),
            ),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("true\n(concave)")),
            ),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("true\n(convex)")),
            ),
          ]),
          Row(
            children: <Widget>[
              Neumorphic(
                drawSurfaceAboveChild: false,
                margin: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                style: const NeumorphicStyle(
                  surfaceIntensity: 1,
                  shape: NeumorphicShape.concave,
                ),
              ),
              const SizedBox(width: 12),
              Neumorphic(
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                  surfaceIntensity: 1,
                  shape: NeumorphicShape.concave,
                ),
              ),
              const SizedBox(width: 12),
              Neumorphic(
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                  intensity: 1,
                  shape: NeumorphicShape.convex,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Neumorphic(
                drawSurfaceAboveChild: false,
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  surfaceIntensity: 1,
                  shape: NeumorphicShape.concave,
                ),
              ),
              const SizedBox(width: 12),
              Neumorphic(
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                  surfaceIntensity: 1,
                  boxShape: NeumorphicBoxShape.circle(),
                  shape: NeumorphicShape.concave,
                ),
              ),
              const SizedBox(width: 12),
              Neumorphic(
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumorphicStyle(
                  surfaceIntensity: 1,
                  boxShape: NeumorphicBoxShape.circle(),
                  shape: NeumorphicShape.convex,
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
