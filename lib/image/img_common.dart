
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCommonPage extends StatelessWidget {

  const ImageCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*设置圆角*/
              Container(
                width: 300,
                height: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(image: AssetImage("img/test.jpeg"),
                      fit: BoxFit.fitWidth
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              
              /*设置圆角*/
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("img/test.jpeg",width: 300,height: 200,),
              ),
              /*设置圆形图片*/
              const CircleAvatar(
                //头像半径
                radius: 60,
                //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                backgroundImage: NetworkImage(
                    'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'
                ),
              ),
              /*设置圆角*/
              ClipOval(
                child: Image.network(
                  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              /*斜切角*/
              Container(
                  width: 120,
                  height: 120,
                  decoration: ShapeDecoration(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg')
                      )
                  )
              ),
              /*圆角*/
              Container(
                  width: 120,
                  height: 120,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      ),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg')
                      )
                  )
              ),
              /*体育场*/
              Container(
                  width: 200,
                  height: 120,
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.amberAccent)
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg')
                      )
                  )
              ),
              /*圆角*/
              Container(
                  width: 120,
                  height: 120,
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.blueAccent)
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg')
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}