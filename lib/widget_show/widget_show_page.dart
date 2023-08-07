import 'package:flutter/material.dart';

class WidgetShowPage extends StatefulWidget {
  const WidgetShowPage({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetShowPageState();

}

class _WidgetShowPageState extends State<WidgetShowPage>{
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              PhysicalModel(
                color: Colors.blue,
                elevation: 6.0,
                shape: BoxShape.circle,
                child: Container(
                  width: 100,
                  height: 100,
                ),
              )
            ],
          ),
        ));
  }
}