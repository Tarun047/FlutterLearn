import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIdx = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'Green', 'score': 30},
        {'text': 'White', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Dog', 'score': 20},
        {'text': 'Frog', 'score': 30},
        {'text': 'Rabbit', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favourite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Phil', 'score': 20},
        {'text': 'George', 'score': 30},
        {'text': 'Harry', 'score': 40}
      ]
    }
  ];
  var _totalScore = 0;

  void _onAnswer(int score) {
    _totalScore += score;
    if (_questionIdx < _questions.length) {
      setState(() {
        _questionIdx = _questionIdx + 1;
      });
      print(_questionIdx);
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Super Awesome app'),
        ),
        body: _questionIdx < _questions.length
            ? Quiz(
                questions: _questions,
                onAnswer: _onAnswer,
                questionIdx: _questionIdx)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
