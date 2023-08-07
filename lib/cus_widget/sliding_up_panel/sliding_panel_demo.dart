
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/sliding_up_panel/panel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SlidingPanelDemo extends StatefulWidget {

  const SlidingPanelDemo({super.key});

  @override
  State<StatefulWidget> createState() => _SlidingPanelDemoState();

}

class _SlidingPanelDemoState extends State<SlidingPanelDemo>{

  PanelController controller = PanelController();
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: (){
              if(controller.isPanelOpen ){
                controller.close();
              }else {
                controller.open();
              }
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text("开关"),
            ),
          ),

          SlidingUpPanel(
            backdropColor: Colors.red,
            backdropEnabled: true,
            controller: controller,
            // panel: const Text("12313123"),
            panelBuilder: (sc){
              return ListView.builder(
                  controller: sc,
                  itemCount: 100,
                  itemBuilder: (context,index){
                    return Text("12312");
                  });
            },
          )
        ],
      ),
    );
  }

}