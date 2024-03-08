

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_demo/generated/assets.dart';

class DecorationBlendModelPage extends StatefulWidget {
  const DecorationBlendModelPage({super.key});

  @override
  State<StatefulWidget> createState() => _DecorationBlendModelPageState();

}

class _DecorationBlendModelPageState extends State<DecorationBlendModelPage>{
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.yellow,
      child:  ListView(
        children: [
          //直接设置透明 并看不见底色
          Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red.withAlpha(240), //这个是src
                  backgroundBlendMode: BlendMode.srcIn
              ),
              alignment: Alignment.center,
              child: Container(
                color: Colors.green,
                width: 50,
                height: 50,
              )
          ),
          Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red.withAlpha(150), //这个是src
                  backgroundBlendMode: BlendMode.srcOut
              ),
              alignment: Alignment.center,
              child: Container(
                color: Colors.green,
                width: 50,
                height: 50,
              )
          ),
          Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red.withAlpha(140), //这个是src
                  backgroundBlendMode: BlendMode.dstOut
              ),
              alignment: Alignment.center,
              child: Container(
                color: Colors.green,
                width: 50,
                height: 50,
              )
          ),

          SizedBox(
            height: 100,
            width: double.infinity,
            //ColorFiltered 影响的返回 跟child一般大小
            child:  ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(155),
                  BlendMode.srcOut
              ),
              //child 是dst
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        color: Colors.blue, //这个是src
                        backgroundBlendMode: BlendMode.dstOut
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                    color: Colors.black,
                    width: 50,
                    height: 50,
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: 100,
            width: double.infinity,
            //ColorFiltered 影响的返回 跟child一般大小
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue, //这个是src
                      backgroundBlendMode: BlendMode.dstOut
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),

          const SizedBox(height: 50,),
          Image.asset(Assets.imagesConcave),
          SizedBox(
            height: 100,
            child:  ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcOut //绘制底色相交部分的其余内容 所有dst 内容镂空
              ),
              //child 是dest
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //像这种纯色的 ColorFiltered 会直接给忽略成透明的
                  Image.asset(Assets.imagesConcave),
                  // Container(width: 100,height: 100,color: Colors.grey,),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 100,
            child:  ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.dstOut //dst out 没有内容 所以 啥也没有展示
              ),
              //child 是dest
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //像这种纯色的 ColorFiltered 会直接给忽略成透明的
                  Image.asset(Assets.imagesConcave),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 100,
            child:  ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.dstIn //展示相交部分 dest 所以 展示的是dst
              ),
              //child 是dest
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //像这种纯色的 ColorFiltered 会直接给忽略成透明的
                  Image.asset(Assets.imagesConcave),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child:  ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcOut //展示相交部分 src  所以 展示的是红色
              ),
              //child 是dest
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //像这种纯色的 ColorFiltered 会直接给忽略成透明的
                  Image.asset(Assets.imagesConcave),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 100,
            width: double.infinity,
            //ColorFiltered 影响的返回 跟child一般大小
            child:  ColorFiltered(
              colorFilter:  ColorFilter.mode(
                  Colors.red.withAlpha(50),
                  BlendMode.srcOut //展示相交部分 src  所以 展示的是红色
              ),
              //child 是dest
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}