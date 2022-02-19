import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int currentIndex;
  final VoidCallback answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.currentIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[currentIndex]['questionText'] as String),
        ...(questions[currentIndex]['answers'] as List<String>)
            .map((answer) => Answer(answerQuestion, answer))
      ],
    );
  }
}
