
import 'package:flutter/material.dart';

class BuilderWidgetPage extends StatefulWidget {

  const BuilderWidgetPage({super.key});


  @override
  State<StatefulWidget> createState() => _BuilderWidgetPageState();

}

class _BuilderWidgetPageState extends State<BuilderWidgetPage> {

  late BuildContext ctx;
  Offset offset = const Offset(0, 0);
  Size size = Size(0, 0);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        //
        var renderBox =  ctx.findRenderObject() as RenderBox;
        offset = renderBox.localToGlobal(Offset.zero);
        size = renderBox.size;
        setState(() {

        });
      },
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Builder(
          builder: (ctx){
            this.ctx = ctx;
            return Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text("${offset.dx}\n${offset.dy}\n${size.width}\n${size.height}",style: TextStyle(fontSize: 12),),
            );
          },
        ),
      ),
    );
  }
}