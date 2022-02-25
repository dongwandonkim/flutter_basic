import 'package:flutter/material.dart';
import 'package:assignment1/text_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<String> _text = ['first text', 'second text', 'third text'];
  int _currentIndex = 0;

  // void _resetCurrentIndex() {
  //   if (_currentIndex >= _text.length) {
  //     setState(() {
  //       _currentIndex = 0;
  //     });
  //   }
  // }

  void _textHandler() {
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('My appbar')),
          body: Center(
              child: TextController(_text, _currentIndex, _textHandler))),
    );
  }
}
