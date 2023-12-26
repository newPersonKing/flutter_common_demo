

import 'package:flutter/services.dart';
import 'package:flutter_common_demo/network/print.dart';

/// 每四位数字加空格
class TextInputFormatterCard extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // print(" baseoffse is  ${newValue.selection.baseOffset}");
    //光标的位置 从0开始
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    //获取输入的文本
    var inuptData = newValue.text.replaceAll(" ", "");
    //创建字符缓存体
    var stringBuffer = StringBuffer();

    for (var i = 0; i < inuptData.length; i++) {
      //获取每一个字条 inuptData[i]
      stringBuffer.write(inuptData[i]);
      //index 当前字条的位置
      var index = i + 1;
      //每四个字条中间添加一个空格 最后一位不在考虑范围里
      if (index % 4 == 0 && inuptData.length != index) {
        stringBuffer.write("  ");
      }
    }
    printMsg("oldValue.selection.baseOffset===${oldValue.selection.baseOffset}");
    printMsg("oldValue.selection.extentOffset===${oldValue.selection.extentOffset}");
    printMsg("newValue.selection.baseOffset===${newValue.selection.baseOffset}");
    printMsg("newValue.selection.extentOffset===${newValue.selection.extentOffset}");
    return TextEditingValue(
      //当前的文本
      text: stringBuffer.toString(),
      //光标的位置
      // selection: TextSelection.collapsed(
      //   //设置光标的位置在 文本最后
      //   offset: stringBuffer.toString().length,
      // ),
      selection: TextSelection.collapsed(
        //保持光标不动
        offset: oldValue.selection.baseOffset,
      ),
    );
  }
}