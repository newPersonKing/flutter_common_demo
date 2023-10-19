

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedButtonDemo extends StatelessWidget {

  const ElevatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {

    return Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape: const StadiumBorder()),
                    child: const Center(child: Text('Elevated Button')),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 45,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape: const CircleBorder()),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape: const OvalBorder()),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                SizedBox(height: 30,),
                //斜切角
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape:  BeveledRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                SizedBox(height: 30,),
                //圆角
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape:  ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28.0))),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape:  ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28.0))),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10, shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0))),
                    child: const Center(child: Icon(Icons.add)),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}