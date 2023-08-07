import 'package:flutter/material.dart';

class SliverPart3SliverAnimatedList extends StatefulWidget {
  const SliverPart3SliverAnimatedList({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverAnimatedList> createState() =>
      _SliverPart3SliverAnimatedListState();
}

class _SliverPart3SliverAnimatedListState
    extends State<SliverPart3SliverAnimatedList> {
  final GlobalKey<SliverAnimatedListState> _listKey =
  GlobalKey<SliverAnimatedListState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  late List<int> _list;

  int? _selectedItem;

  late int
  _nextItem;

  @override
  void initState() {
    super.initState();
    _list = <int>[0, 1, 2];
    _nextItem = 3;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  void _insert() {
    final int index =
    _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
    _listKey.currentState!.insertItem(index,duration: Duration(seconds: 1));
  }

  void _remove() {
    final int index = _selectedItem == null
        ? _list.length - 1
        : _list.indexOf(_selectedItem!);
    _list.removeAt(index);
    // _listKey.currentState!.removeItem(
    //   index,
    //       (context, animation) => LayoutBuilder(builder: (context,cons){
    //         print("animation===${animation.value}");
    //         animation.addListener(() {
    //           print("animation===${animation.value}");
    //         });
    //         return SizeTransition(
    //           sizeFactor: animation,
    //           axis: Axis.vertical,
    //           child: Card(
    //             child: Center(
    //               child: Text(
    //                 'Item $index',
    //                 style: Theme.of(context).textTheme.headline4,
    //               ),
    //             ),
    //           ),
    //         );
    //       }),
    // );
    //



    _listKey.currentState!.removeItem(
      index,
          (context, animation) => LayoutBuilder(builder: (context,cons){
        var width = cons.maxWidth;
        return AnimatedBuilder(animation: animation, builder: (context,anim){
          return Transform.translate(offset: Offset((width * (1- animation.value)),0),
            child:  Card(
              child: Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),);
        });
      }), duration: Duration(seconds: 1));

    setState(() {
      _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      home: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                'SliverAnimatedList',
                style: TextStyle(fontSize: 30),
              ),
              expandedHeight: 60,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
                iconSize: 32,
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _insert,
                  tooltip: 'Insert a new item.',
                  iconSize: 32,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _remove,
                  tooltip: 'Remove the selected item.',
                  iconSize: 32,
                ),
              ],
            ),
            SliverAnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: _buildItem,
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  })  : assert(item >= 0),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 2.0,
        bottom: 0.0,
      ),
      child: FadeTransition(
        opacity: animation,
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: selected
                  ? Colors.black12
                  : Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text(
                  'Item $item Item' ,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}