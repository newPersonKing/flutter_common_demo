

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/back_drop_filter/back_drop_filter_page.dart';
import 'package:flutter_common_demo/system_widget/tabbar/tab_bar_home.dart';
import 'package:flutter_common_demo/system_widget/widget/elevated_button_demo.dart';
import 'package:flutter_common_demo/system_widget/widget/fitted_box_demo.dart';
import 'package:flutter_common_demo/system_widget/widget/over_flow_bar_demo.dart';
import 'package:flutter_common_demo/system_widget/widget/over_flow_box_demo.dart';
import 'package:flutter_common_demo/system_widget/widget/page_storage_demo.dart';
import 'package:flutter_common_demo/system_widget/widget/paginated_data_table_demo.dart';
import 'package:flutter_common_demo/widget_show/widget_show_page.dart';
import '../main.dart';

class SystemWidgetHomePage extends StatelessWidget {

  const SystemWidgetHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      child: SingleChildScrollView(
        child: Column(
         children: [
           commonItem("BackdropFilter 实现模糊",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const BackdropFilterPage();
             }));
           }),
           commonItem("tabBar",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  TabBarPage();
             }));
           }),
           commonItem("ElevatedButtonDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return ElevatedButtonDemo();
             }));
           }),

           commonItem("PaginatedDataTableDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return PaginatedDataTableDemo();
             }));
           }),
           commonItem("PageStorageDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return PageStorageDemo();
             }));
           }),
           commonItem("FittedoxDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return FittedBoxDemo();
             }));
           }),
           commonItem("OverflowBoxDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return OverflowBoxDemo();
             }));
           }),
           commonItem("OverflowBarDemo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return OverflowBarDemo();
             }));
           }),
           commonItem("PhysicalModel Demo",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const WidgetShowPage();
             }));
           }),
         ],
        ),
      ),
    );
  }
}