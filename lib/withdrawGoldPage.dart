import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WithdrawGoldPage extends StatefulWidget {
  const WithdrawGoldPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return WithdrawGoldPageState();
  }
}

class WithdrawGoldPageState extends State<WithdrawGoldPage> {

  @override
  void initState() {
    super.initState();
  }
  Widget topUI() {
    return Container(
      color: const Color(0xFFFFFACA),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "S.current.Current_gold_coins",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 3,
              ),
              Container(
                width: 24,
                height: 24,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color(0xFFD2F6E2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget payTypeUI() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

              SizedBox(
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "S.current.Choose_payment_method",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
            ],
          ),
        ],
      ),
    );
  }


  final ValueNotifier _payTipValueNotifier = ValueNotifier("");

  Widget withdrawSelectorUI() {
    return Expanded(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1231312",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                payTypeItemUI(),
              ],
            )));
  }


  Widget payTypeItemUI() {
    return Expanded(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 156 / 90.0),itemCount: 4, itemBuilder: (context,index){
              return SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF2DC2A0),
                            Color(0xFFFFF970)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(8)),
                ),
              );
            }),
            SliverToBoxAdapter(
                child: Container(
                  // 设置页脚跨越两列
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "S.current.illustrate",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ValueListenableBuilder(
                            valueListenable: _payTipValueNotifier,
                            builder: (context, value, child) {
                              return Text(value,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400));
                            }),
                        SizedBox(height: 16,),
                        Container(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("123123",style: TextStyle(fontSize: 16,color:Colors.white),),
                          ),
                        ),
                      ],
                    )))
          ],
        ));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor:Colors.white
      ),
      body: RepaintBoundary(
        child: Column(
          children: [
            topUI(),
            SizedBox(
              height: 10,
            ),
            payTypeUI(),
            SizedBox(
              height: 400,
            ),
            withdrawSelectorUI(),
          ],
        ),
      ),
    );
  }
}
