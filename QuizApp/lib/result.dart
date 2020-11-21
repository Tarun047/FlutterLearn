import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function onReset;
  Result(this.score, this.onReset);

  String get resultPhrase {
    var resultText = 'You did it! ';
    if (score <= 30) {
      resultText = 'You are awesome';
    } else if (score <= 40) {
      resultText = 'You are cool';
    } else {
      resultText = 'Legend';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: onReset,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
