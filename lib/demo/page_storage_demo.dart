
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final PageStorageBucket _bucket = PageStorageBucket();

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(
            "$index",
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      },
    );
  }
}

class PageStorageDemo extends StatefulWidget {

  const PageStorageDemo({super.key});

  @override
  State<StatefulWidget> createState() => _PageStorageDemoState();
}

class _PageStorageDemoState extends State<PageStorageDemo>{
  var _index = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('PageStorage')),
      body: PageStorage(
        bucket: _bucket,
        child: const [
          ColorPage(key: PageStorageKey("one")),
          ColorPage()
        ][_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) {
          _index = index;
          setState(() {});
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

}
