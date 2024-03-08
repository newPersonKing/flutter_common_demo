

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/data_picker/date_picker_1_demo.dart';

import '../../main.dart';

class DatePickerPage extends StatelessWidget {
  const DatePickerPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: ListView(
        children: [
          commonItem("ruler",(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const DatePicker1Page();
            }));
          }),
        ],
      ),
    );
  }

}