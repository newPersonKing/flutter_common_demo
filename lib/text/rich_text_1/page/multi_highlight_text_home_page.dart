

import 'package:flutter/material.dart';
import 'package:flutter_common_demo/text/rich_text_1/page/simple_page.dart';

import 'ch_correct_error_page.dart';
import 'en_correct_error_page.dart';

class MultiHighlightTextHomePage extends StatefulWidget {
  const MultiHighlightTextHomePage({Key? key}) : super(key: key);

  @override
  State<MultiHighlightTextHomePage> createState() => _MultiHighlightTextHomePageState();
}

class _MultiHighlightTextHomePageState extends State<MultiHighlightTextHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi HighLight Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SimplePage()));
                  },
                  child: const Text("simple_page"),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChCorrectErrorPage()));
                  },
                  child: const Text("correct_error_page(chinese)"),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EnCorrectErrorPage()));
                  },
                  child: const Text("correct_error_page"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}