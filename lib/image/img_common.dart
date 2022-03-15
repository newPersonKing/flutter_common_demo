
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("img/test.jpeg",width: 300,height: 200,),
              ),
            ],
          ),
        ),
      ),
    );
  }

}