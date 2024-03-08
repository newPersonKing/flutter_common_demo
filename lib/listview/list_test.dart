
import 'package:flutter/material.dart';

import 'ensure_visible_when_focused.dart';

class FindFocusItemPage extends StatefulWidget {
  const FindFocusItemPage({super.key});

  @override
  _FindPocusItemPageState createState() => _FindPocusItemPageState();
}

class _FindPocusItemPageState extends State<FindFocusItemPage> {
  late GlobalKey<FormState> _formKey;
  late FocusNode _focusNode;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...List.generate(
                    30,
                        (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Form Field ${i + 1}',
                        ),
                      ),
                    ),
                  ).toList(),
                  // EnsureVisibleWhenFocused(
                  //   focusNode: _focusNode,
                  //   duration: Duration(seconds: 1),
                  //   child: TextFormField(
                  //     focusNode: _focusNode,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: '* Form Field',
                  //     ),
                  //     validator: (value) => 'Required Field',
                  //   ),
                  // ),
                  ...List.generate(
                    30,
                        (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: i == 1 ?   EnsureVisibleWhenFocused(
                        focusNode: _focusNode,
                        duration: const Duration(seconds: 10),
                        child: TextFormField(
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '* Form Field',
                          ),
                          validator: (value) => 'Required Field',
                        ),
                      ):TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Form Field ${i + 1}',
                        ),
                      ),
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final _form = _formKey.currentState!;
            _form.validate();
            _focusNode.requestFocus();
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
