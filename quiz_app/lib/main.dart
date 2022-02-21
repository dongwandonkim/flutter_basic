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
      'answers': [
        {'text': 'kim', 'score': 1},
        {'text': 'don', 'score': 3},
        {'text': 'dongwan', 'score': 5},
        {'text': 'dong', 'score': 2}
      ]
    },
    {
      'questionText': 'whats my age',
      'answers': [
        {'text': '12', 'score': 1},
        {'text': '24', 'score': 3},
        {'text': '37', 'score': 5},
        {'text': '3', 'score': 2}
      ]
    },
    {
      'questionText': 'what are my cats names',
      'answers': [
        {'text': 'abu', 'score': 3},
        {'text': 'garu', 'score': 3},
        {'text': 'abugaru', 'score': 5},
        {'text': 'nana', 'score': 3}
      ]
    },
  ];
  var _currentIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

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
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
