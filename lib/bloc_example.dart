
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_example_bloc.dart';

class BlocExamplePage extends StatefulWidget {
  const BlocExamplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlocExamplePageState();
  }
}

class _BlocExamplePageState extends State<BlocExamplePage> {
  final BlocExampleBloc _bloc = BlocExampleBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BlocExamplePage"),
        ),
        body: BlocProvider(
          create: (BuildContext context) => _bloc,
          child: BlocListener<BlocExampleBloc,BlocExampleState>(listener:(pre,current) {

          },child: Column(
            children: [
              MaterialButton(color: Colors.blue,
                onPressed: () {
                  _bloc.add(UpdateBlocEvent(true));
                },
                child: const Text("+1"),
              ),
              MaterialButton(color: Colors.blue,
                onPressed: () {
                  _bloc.add(UpdateBlocEvent(false));
                },
                child: const Text("-1"),
              ),
              Text((_bloc.state.content ?? 0).toString())
            ],
          ),)
        ));
  }
}
