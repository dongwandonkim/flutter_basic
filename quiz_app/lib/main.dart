import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'whats my name',
      'answers': ['kim', 'don', 'dongwan', 'dondon']
    },
    {
      'questionText': 'whats my age',
      'answers': ['123', '456', '33', "37"]
    },
    {
      'questionText': 'what are my cats names',
      'answers': ['abugaru', 'don', 'dongwan', 'nana']
    },
  ];
  var _currentIndex = 0;

  void _answerQuestion() {
    if (_currentIndex < _questions.length) {}
    setState(() {
      _currentIndex = _currentIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('My first app')),
          body: _currentIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  currentIndex: _currentIndex,
                  questions: _questions,
                )
              : Result()),
    );
  }
}
