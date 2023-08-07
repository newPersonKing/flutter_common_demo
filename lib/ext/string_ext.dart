//
//  string_ext.dart
//  flutter_templet_project
//
//  Created by shang on 8/3/21 11:41 AM.
//  Copyright © 8/3/21 shang. All rights reserved.
//


import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

typedef TransformCallback<E> = E Function(E e);

extension StringExt on String{

  static bool isEmpty(String? val) {
    return val == null || val.isEmpty;
  }

  static bool isNotEmpty(String? val) {
    return val != null && val.isNotEmpty;
  }

  ///运算符重载
  String operator *(int value) {
    var result = '';
    for (var i = 0; i < value; i++) {
      result += this;
    }
    return result;
  }


  /// 转 Map<String, dynamic>
  Map<String, dynamic>? decodeMap({Object? Function(Object? key, Object? value)? reviver}) {
    if (this.isEmpty) {
      return null;
    }

    try {
      final result = jsonDecode(this, reviver: reviver) as Map<String, dynamic>?;
      return result;
    } catch (exception) {
      debugPrint("decodeMap: exception: $exception");
      return null;
    }
  }

  /// 转 List<dynamic>
  List<dynamic>? decodeList({Object? Function(Object? key, Object? value)? reviver}) {
    if (this.isEmpty) {
      return null;
    }

    try {
      final result = jsonDecode(this, reviver: reviver) as List<dynamic>?;
      return result;
    } catch (exception) {
      debugPrint("decodeList: exception: $exception");
      return null;
    }
  }

  /// 同 int.parse(this)
  int get parseInt => int.parse(this);
  /// 同 int.tryParse(this)
  int? get tryParseInt => int.tryParse(this);
  /// 同 double.parse(this)
  double get parseDouble => double.parse(this);
  /// 同 double.tryParse(this)
  double? get tryParseDouble => double.tryParse(this);

  ///首字母大写
  String toCapitalize() {
    if (length == 0) return this;
    return "${substring(0, 1).toUpperCase()}${substring(1)}";
  }

  ///驼峰命名法, ["_", "-"].contains(separator)
  String camlCase(String separator, {bool isUpper = true}) {
    assert(["_", "-"].contains(separator));
    if (!contains(separator)) {
      return this;
    }

    return split(separator).map((e) {
      final index = e.indexOf(this);
      return index == 0 && isUpper == false ? e : e.toCapitalize();
    }).join("");
  }
  ///反驼峰命名法
  String uncamlCase(String separator) {
    var reg = RegExp(r'[A-Z]');
    if (!reg.hasMatch(separator)) {
      return this;
    }
    return split("").map((e) {
      final index = indexOf(e);
      // ddlog([e, index, reg.hasMatch(e) && index != 0]);
      return reg.hasMatch(e) && index != 0 ? "$separator${e.toLowerCase()}" : e.toLowerCase();
    }).join("");
  }

  /// 转为 int
  int? toInt() {
    final regInt = RegExp(r"[0-9]");
    final regIntNon = RegExp(r"[^0-9]");

    if (contains(regInt)) {
      final result = replaceAll(regIntNon, '');
      return int.tryParse(result);
    }
    return int.tryParse(this);
  }

  ///解析
  static parseResponse(dynamic data) {
    var result = "";
    if (data is Map) {
      result += json.encode(data);
    } else if (data is List) {
      result += json.encode(data);
    } else if (data is bool || data is num) {
      result += data.toString();
    } else if (data is String) {
      result += data;
    }
    return result;
  }

  /// 处理字符串中包含数字排序异常的问题
  int compareCustom(String b) {
    var a = this;

    var regInt = RegExp(r"[0-9]");
    var regIntNon = RegExp(r"[^0-9]");

    if (a.contains(regInt) && b.contains(regInt)) {
      final one = int.parse(a.replaceAll(regIntNon, ''));
      final two = int.parse(b.replaceAll(regIntNon, ''));
      return one.compareTo(two);
    }
    return a.compareTo(b);
  }

}
