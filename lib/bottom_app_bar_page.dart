

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomAppBarPage extends StatefulWidget {
  const BottomAppBarPage({super.key});

  @override
  State<StatefulWidget> createState() => BottomAppBarPageState();
}

class BottomAppBarPageState extends State<BottomAppBarPage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter demo')),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),//凹槽
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: Colors.red),
                      Text('Home', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                )),
            const SizedBox(width: 80),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.business, color: Colors.green),
                      Text('Business', style: TextStyle(color: Colors.green))
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {},
        child: const Icon(Icons.add, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,//
    );
  }

}