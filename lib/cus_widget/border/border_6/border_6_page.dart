import 'package:flutter/material.dart';
import 'package:flutter_common_demo/cus_widget/border/border_6/r_dotted_line_border.dart';


class Border6Page extends StatefulWidget {

  const Border6Page({super.key});

  @override
  _Border6PageState createState() => _Border6PageState();
}

class _Border6PageState extends State<Border6Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: RDottedLineBorder.all(
                    width: 1,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: RDottedLineBorder.all(),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: RDottedLineBorder.all(),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      left: BorderSide(
                        color: Colors.red,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      top: BorderSide(
                        color: Colors.orange,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      right: BorderSide(
                        color: Colors.yellow,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      left: BorderSide(
                        color: Colors.blue,
                      ),
                      bottom: BorderSide(
                        color: Colors.blue,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      bottom: BorderSide(
                        color: Colors.green,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      top: BorderSide(
                        color: Colors.purple,
                      ),
                      right: BorderSide(
                        color: Colors.purple,
                      )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  border: RDottedLineBorder(
                      dottedLength: 10,
                      dottedSpace: 2,
                      top: BorderSide(
                        color: Colors.purple,
                      ),
                      right: BorderSide(
                        color: Colors.grey,
                      ),
                      bottom: BorderSide(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}