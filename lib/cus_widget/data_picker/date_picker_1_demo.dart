

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lunar_datetime_picker/date_init.dart';
import 'package:flutter_lunar_datetime_picker/flutter_lunar_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class DatePicker1Page extends StatefulWidget {
  const DatePicker1Page({super.key});

  @override
  State<DatePicker1Page> createState() => _DatePicker1PageState();
}

class _DatePicker1PageState extends State<DatePicker1Page> {
  /// 日期
  String? time = '1995-11-8 12:12';

  /// 是否是农历
  bool lunar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日期选择器"),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "日期:$time",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    lunarPicker: lunar,
                    dateInitTime: time == null
                        ? DateInitTime(
                        currentTime: DateTime.now(),
                        maxTime: DateTime(2026, 12, 12),
                        minTime: DateTime(1995, 2, 4))
                        : DateInitTime(
                        currentTime:
                        DateFormat("yyyy-MM-dd h:m").parse(time ?? ""),
                        maxTime: DateTime(2026, 12, 12),
                        minTime: DateTime(1995, 2, 4)),
                    onConfirm: (time, lunar) {
                      debugPrint(time.toString());
                      setState(() {
                        this.time =
                        "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}";
                        this.lunar = lunar;
                      });
                    },
                    onChanged: (time, lunar) {
                      debugPrint("change:${time.toString()}");
                    },
                  );
                },
                child: const Text("选择"),
              )
            ],
          )),
    );
  }
}