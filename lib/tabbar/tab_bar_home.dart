import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/tabbar/underline_tab_indicator_impl.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;


  Widget _buildTabBar(List<String> tabs) {

    //1 TabBar 的每一个item 左右各加了 16的间距
    return TabBar(
        labelPadding: EdgeInsets.zero,
        indicator: const UnderlineTabIndicatorImpl(
            borderSide: BorderSide(width: 2.0, color: Colors.blue),
            insets: EdgeInsets.only(left: 20,right:20,)),
        indicatorColor: Colors.green,
        controller: tabController,
        isScrollable: true,
        tabs: tabs
            .map((e) => Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ))
            .toList());
  }

  var tabs = ["标签","标签","1标签","标签","标签","标签","标签","标签","标签","标签",];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    return Material(
      child: Column(
        children: [
          Container(
            height: padding.top,
            color: Colors.yellow,
          ),
          _buildTabBar(tabs),

        ],
      ),
    );
  }
}
