import 'package:flutter/material.dart';

import 'utils.dart';

class Score extends StatelessWidget {
  Score({int score = 0, int totalAttempted = 0})
      : this._score = score,
        this._totalAttempted = totalAttempted;

  int _score;
  int _totalAttempted;

  int get score => _score;
  void set score(int num) => _score = num;

  int get totalAttempted => _totalAttempted;
  void set totalAttempted(int num) => _totalAttempted = num;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Score: ${score} / ${totalAttempted}',
      style: getTextStyle(FontWeight.bold, 36, Colors.black),
    );
  }
}
