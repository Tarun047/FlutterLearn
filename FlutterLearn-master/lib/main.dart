import 'package:flutter/material.dart';
import 'package:test_app/Answer.dart';
import 'package:test_app/question.dart';

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
  final questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': ["Red", "Blue", "Green", "White"]
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': ["Dog", "Cat", "Frog", "Rabbit"]
    },
    {
      'questionText': 'What\'s your favourite instructor ?',
      'answers': ["Max", "Phil", "George", "Harry"]
    }
  ];

  void _onAnswer() {
    if (_questionIdx < questions.length) {
      setState(() {
        _questionIdx = _questionIdx + 1;
      });
      print(_questionIdx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Super Awesome app'),
        ),
        body: _questionIdx < questions.length ?
        Column(
          children: [
            Question(questions[_questionIdx]['questionText']),
            ...(questions[_questionIdx]['answers'] as List<String>).map((
                answer) => Answer(answer, _onAnswer)).toList()
          ],
        )
            : Center(
          child: Text("Your'e done!"),
        ),
      ),
    );
  }
}
