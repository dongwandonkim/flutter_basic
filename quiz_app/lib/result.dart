import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;

    if (resultScore >= 8) {
      resultText = 'awesome!';
    } else if (resultScore >= 5) {
      resultText = 'good job';
    } else if (resultScore < 4) {
      resultText = 'no good';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'Your score is ${resultScore.toString()}',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(onPressed: resetQuiz, child: Text('Restart Quiz'))
      ]),
    );
  }
}
