import 'package:flutter/material.dart';
import 'package:my_app/utils.dart';
import 'countries.dart';
import 'custom_button.dart';
import 'custom_card.dart';
import 'quiz.dart';
import 'score.dart';

class FlashCardApp extends StatelessWidget {
  const FlashCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashCard(),
    );
  }
}

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool showAnswer = false;
  bool showAlert = false;

  final countries = Countries();
  final quiz = Quiz();

  void toggleShowAnswer() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  void markAnswerAsCorrect() {
    setState(() {
      if (quiz.currentIndex < countries.countryCount - 1) {
        quiz.answerIsCorrect();
      } else {
        showEOLAlert(context);
      }
    });
  }

  void markAnswerAsWrong() {
    setState(() {
      if (quiz.currentIndex < countries.countryCount - 1) {
        quiz.answerIsWrong();
      } else {
        showEOLAlert(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text('Guess the Capital City'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: CustomCard(
              bodyWidget: Score(
                score: quiz.score,
                totalAttempted: quiz.totalAttempted,
              ),
              backgroundColor: Colors.lightBlue.shade50,
            ),
          ),
          CustomCard(
            headingWidget: Text(
              !showAnswer ? 'Country:' : 'Capital',
              style: getTextStyle(FontWeight.bold, 36, Colors.black),
            ),
            bodyWidget: Text(
              !showAnswer
                  ? countries.getCountry(quiz.currentIndex)
                  : countries.getCapital(quiz.currentIndex),
              style: getTextStyle(FontWeight.bold, 36, Colors.indigo),
            ),
            height: 200,
            onTapFunction: toggleShowAnswer,
            info: 'Tap this card to toggle question/answer.',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: 'Correct',
                backgroundColor: Colors.green,
                onPress: markAnswerAsCorrect,
              ),
              CustomButton(
                title: 'Wrong',
                backgroundColor: Colors.red,
                onPress: markAnswerAsWrong,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quiz.reset();
            showAnswer = false;
          });
        },
        child: Text('Reset'),
      ),
    );
  }
}
