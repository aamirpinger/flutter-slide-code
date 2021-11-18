import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  Score({
    score = 0,
    int totalAttempted = 0,
    TextStyle? textStyle,
  })  : this._score = score,
        this._totalAttempted = totalAttempted,
        this._textStyle = textStyle;

  int _score;
  int _totalAttempted;
  TextStyle? _textStyle;

  int get score => _score;
  void set score(int num) => _score = num;

  int get totalAttempted => _totalAttempted;
  void set totalAttempted(int num) => _totalAttempted = num;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Score: ${score} / ${totalAttempted}',
      style: _textStyle != null
          ? _textStyle
          : Theme.of(context).textTheme.headline4,
    );
  }
}
