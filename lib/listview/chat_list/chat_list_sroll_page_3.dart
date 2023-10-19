

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/network/print.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatListViewPage3 extends StatefulWidget {
  const ChatListViewPage3({super.key});

  @override
  State<StatefulWidget> createState() => _ChatListViewPage3State();

}

class _ChatListViewPage3State extends State<ChatListViewPage3>{

  var isShrinkWrap = ValueNotifier(true);
  List<String> data =  ["1","2","3"];
  List<String> showData = [];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(child: ValueListenableBuilder<bool>(
            valueListenable: isShrinkWrap,
            builder: (context,value,child){
              List<String> showData = data;
              return SmartRefresher(
                enablePullUp: true,
                enablePullDown: true,
                reverse: true,
                controller: RefreshController(),
                child: value ? Container(
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Container(height: 100,width: double.infinity,color: Colors.green,child: Text(showData[index]),);
                      },
                      reverse: true,
                      itemCount: showData.length),
                ):ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    physics:  const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: false,
                    itemBuilder: (context,index){
                      return Container(height: 100,width: double.infinity,color: Colors.green,child: Text(showData[index]),);
                    },
                    reverse: true,
                    itemCount: showData.length),
              );
            },
          )),
          GestureDetector(
            onTap: (){
              setState(() {
                data.add("${data.length+1}");
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  printMsg("position===${scrollController.position.maxScrollExtent}");
                  isShrinkWrap.value = scrollController.position.maxScrollExtent <= 0;
                });
              });
            },
            child:  Container(height: 100,width: double.infinity,color: Colors.yellow,),
          )
        ],
      ),
    );
  }
}

