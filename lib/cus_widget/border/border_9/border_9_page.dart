import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_demo/cus_widget/border/border_9/polygon_border.dart';
import 'package:flutter_common_demo/cus_widget/border/border_9/polygon_clip.dart';

const nbs = <int>[3, 4, 5, 6, 7, 8, 9, 10];
const rotates = <double>[0, 30, 60, 90, 120, 150, 180];
const colors = <Color>[
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class Border9Page extends StatefulWidget {
  const Border9Page({super.key});


  @override
  _Border9PageState createState() => _Border9PageState();
}

class _Border9PageState extends State<Border9Page> {

  int nb = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Flutter Polygon'),
        backgroundColor: Colors.blue[900],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        shape: PolygonBorder(sides: nb),
        child: const Icon(Icons.star),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
          const RoundedRectangleBorder(),
          PolygonBorder(sides: nb),
        ),
        color: Colors.orange,
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.code),
              onPressed: () {},
            ),
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {}
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 96.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 8.0,),
            Text(
                'Chips',
                style: Theme.of(context).textTheme.headline6
            ),
            _showCase(nbs.map(_chip)),
            const SizedBox(height: 8.0,),
            Text(
                'Buttons',
                style: Theme.of(context).textTheme.headline6
            ),
            _showCase(nbs.map(_button)),
            const SizedBox(height: 8.0,),
            Text(
                'Containers',
                style: Theme.of(context).textTheme.headline6
            ),
            _showCase(nbs.map(_container)),
            _showCase(nbs.map((nb) => _container(nb, width: 2, rotate: 15.0))),
            _showCase(nbs.map((nb) => _container(nb, width: 3, rotate: 30.0))),
            const SizedBox(height: 8.0,),
            Text(
                'Clipped Image',
                style: Theme.of(context).textTheme.headline6
            ),
            const SizedBox(height: 8.0,),
            _image(nb),
          ],
        ),
      ),
    );
  }

  Widget _showCase(Iterable<Widget> widgets) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: widgets.toList(),
      ),
    );
  }

  Widget _image(int sides) {
    return ClipPolygon(
      child: Image.network("https://cdn.pixabay.com/photo/2018/01/05/00/20/test-image-3061864_960_720.png"),
      boxShadows: [
        PolygonBoxShadow(color: Colors.black, elevation: 2.0),
        PolygonBoxShadow(color: Colors.yellow, elevation: 4.0),
        PolygonBoxShadow(color: Colors.red, elevation: 6.0),
      ],
      sides: sides,
      borderRadius: 10,
    );
  }

  Widget _button(int sides, {BorderSide side = BorderSide.none}) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<PolygonBorder>(
            PolygonBorder(sides: sides, side: const BorderSide())
        ),
      ),
      onPressed: () { },
      child: Text('$sides'),
    );
  }

  Widget _chip(int sides, {BorderSide side = BorderSide.none}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        shape: PolygonBorder(
          sides: sides,
          side: side,
        ),
        label: Text('$sides'),
        selected: nb == sides,
        onSelected: (s) {
          setState(() {
            this.nb = sides;
          });
        },
      ),
    );
  }

  Widget _container(int sides, {double width = 1.0, double rotate = 0.0}) {
    var index = (sides-3);
    return Container(
      padding: const EdgeInsets.all(18.0),
      margin: const EdgeInsets.only(right: 16.0),
      decoration: ShapeDecoration(
        shape: PolygonBorder(
          sides: sides,
          rotate: rotate,
          side: BorderSide(
            color: colors[index % colors.length],
            width: width,
          ),
        ),
      ),
      child: Text('$sides'),
    );
  }
}