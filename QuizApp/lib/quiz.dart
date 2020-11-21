import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function onAnswer;
  final int questionIdx;

  Quiz(
      {@required this.questions,
      @required this.questionIdx,
      @required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIdx]['questionText']),
        ...(questions[questionIdx]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
                  answer['text'],
                  () => onAnswer(answer['score']),
                ))
            .toList()
      ],
    );
  }
}
