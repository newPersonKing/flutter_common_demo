import 'package:flutter/material.dart';
import '../ext/text_painter_ext.dart';

class TextCountComputePage extends StatelessWidget {

  final ValueNotifier<bool> isExpand = ValueNotifier(false);

  TextCountComputePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isExpand,
              builder: (context,value,child){
                return  NExpandText(
                  text: 'NExpandTextNExpandTextNExpandTextNExpandTextNExpandTextNExpandTextNExpandText',
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.red
                  ),
                  initiallyExpanded: value,
                );
              },
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                isExpand.value = !isExpand.value;
              },
              child:  Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Text(
                  isExpand.value ? "收起":"展开",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),),
            )
          ],
        ),
      ),
    );
  }


}



///如果文字超过一行,右边有展开收起按钮
class NExpandText extends StatefulWidget {

  /// 字符串
  final String text;

  /// 字符串样式
  final TextStyle textStyle;

  /// 超过一行初始展开状态
  final bool initiallyExpanded;

  /// 展开状态最大行
  final int expandMaxLine;

  /// 展开按钮文字样式
  final TextStyle? expandTitleStyle;

  const NExpandText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.expandMaxLine = 10,
    this.expandTitleStyle,
    this.initiallyExpanded = false,
  }) : super(key: key);



  @override
  _NExpandTextState createState() => _NExpandTextState();
}

class _NExpandTextState extends State<NExpandText> {


  @override
  Widget build(BuildContext context) {

    return buildText(
      text: widget.text,
      textStyle: widget.textStyle,
      isExpand: widget.initiallyExpanded,
      expandMaxLine: widget.expandMaxLine,
      expandTitleStyle: widget.expandTitleStyle,
    );
  }

  buildText({
    required String text,
    required TextStyle textStyle,
    bool isExpand = false,
    int expandMaxLine = 10,
    TextStyle? expandTitleStyle,
  }) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          final textPainter = TextPainterExt.getTextPainter(
            text: text,
            textStyle: textStyle,
            maxLine: 100,
            maxWidth: constraints.maxWidth,
          );
          //计算文本占用的行数
          final numberOfLines = textPainter.computeLineMetrics().length;

          //无参数的 StatefulWidget
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {

                final btnTitle = isExpand ? "收起" : "展开";
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(19))
                        ),
                        child: Container(
                          // color: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(text,
                            style: textStyle,
                            maxLines: isExpand ? expandMaxLine : 1,
                          ),
                        ),
                      ),
                    ),
                    if(numberOfLines > 1) TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(50, 18),
                      ),
                      onPressed: (){
                        isExpand = !isExpand;
                        setState((){});
                      },
                      child: Text(btnTitle, style: expandTitleStyle,),
                    ),
                  ],
                );
              }
          );
        }
    );

  }
}
