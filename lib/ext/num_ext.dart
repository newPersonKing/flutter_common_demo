//
//  NumExtension.dart
//  lib
//
//  Created by shang on 11/29/21 3:38 PM.
//  Copyright © 11/29/21 shang. All rights reserved.
//


import 'dart:math';

import 'package:intl/intl.dart';

extension DoubleExt on double{
  /// 2位小数
  double get fixed2 => double.parse(toStringAsFixed(2));
  /// 3位小数
  double get fixed3 => double.parse(toStringAsFixed(3));

  /// 转为百分比描述
  String toStringAsPercent(int fractionDigits) {
    if (this >= 1.0) {
      return "100%";
    }
    final result = toStringAsFixed(fractionDigits);
    return "${result.replaceAll("0.", "")}%";
  }
}

extension NumberFormatExt on NumberFormat{
  /// 转为百分比描述
  // 返回千分位分隔的金额
  static String? formatAmount(String? val) {
    if (val == '' || val == null) {
      return null;
    }
    double? num = double.tryParse(val);
    if (num == null) {
      return null;
    }
    if (num > 999) {
      var format = NumberFormat('0,000.00');
      return format.format(num);
    } else {
      return val;
    }
  }
}
