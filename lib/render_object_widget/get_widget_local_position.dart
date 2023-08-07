import 'package:flutter/material.dart';
import 'package:flutter_common_demo/render_object_widget/positioned_notification_notifier.dart';

class GetWidgetLocalPositionPage extends StatelessWidget{

  const GetWidgetLocalPositionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: NotificationListener<PositionedNotification>(child: Align(
        alignment: Alignment.center,
        child: PositionedNotificationNotifier(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.green,
          ),
        ),
      ),onNotification: (notification){
        print('ccccc===${notification.offset}');
        return true;
      },),
    );
  }

}