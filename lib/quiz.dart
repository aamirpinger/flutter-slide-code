class Quiz {
  int _currentIndex = 0;
  int _currentScore = 0;
  int _totalAttempted = 0;

  int get currentIndex => _currentIndex;
  int get score => _currentScore;
  int get totalAttempted => _totalAttempted;

  void answerIsCorrect() {
    _currentIndex++;
    _currentScore++;
    _totalAttempted++;
  }

  void answerIsWrong() {
    _currentIndex++;
    _totalAttempted++;
  }

  void reset() {
    _currentIndex = 0;
    _currentScore = 0;
    _totalAttempted = 0;
  }
}
