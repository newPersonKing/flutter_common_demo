

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/listview/refresh/refresh_demo_page.dart';
import 'package:flutter_common_demo/listview/refresh/refresh_demopage2.dart';
import 'package:flutter_common_demo/listview/refresh/refresh_demopage3.dart';
import 'package:flutter_common_demo/listview/visibility_detector/listview_visibility_detector.dart';

import '../main.dart';
import 'chat_list/chat_list_scroll_page.dart';
import 'chat_list/chat_list_scroll_page_2.dart';
import 'chat_list/chat_list_sroll_page_3.dart';
import 'chat_list/chat_list_sroll_page_4.dart';
import 'listview_first_visible_item.dart';

class ListViewHomePage extends StatelessWidget {

  const ListViewHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(

      child: SingleChildScrollView(
        child: Column(
         children: [
           commonItem("找到ListView 第一个可见的view",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const ListViewFirstVisibleItem();
             }));
           }),
           commonItem("VisibilityDetector 统计页面上可见item",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const ListViewVisibilityDetector();
             }));
           }),
           commonItem("refresh1",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const RefreshDemoPage();
             }));
           }),
           commonItem("refresh2",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return const RefreshDemoPage2();
             }));
           }),
           commonItem("refresh3",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  RefreshDemoPage3();
             }));
           }),
           commonItem("chatList 聊天对话框",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const ChatListScrollDemoPage();
             }));
           }),
           commonItem("chatList 聊天对话框2",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const ChatListScrollDemoPage2();
             }));
           }),
           commonItem("ListView reserve 为true",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const ChatListViewPage3();
             }));
           }),
           commonItem("ListView 头部插入数据 不跳转",(){
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return  const ChatListViewPage4();
             }));
           }),
         ],
        ),
      ),
    );
  }
}