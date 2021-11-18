import 'package:flutter/material.dart';
import 'package:my_app/constant/app_strings.dart';
import 'package:my_app/core/class/countries.dart';
import 'package:my_app/core/class/quiz.dart';
import 'package:my_app/core/class/score.dart';
import 'package:my_app/core/utils/utils.dart';
import 'package:my_app/ui/screens/result_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_card.dart';
import 'package:my_app/ui/widgets/infoWidget.dart';

import 'about_screen.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({Key? key}) : super(key: key);

  @override
  _FlashCardScreenState createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  bool showAnswer = false;
  bool showAlert = false;

  final countries = Countries();
  final quiz = Quiz();

  void resetQuiz() {
    setState(() {
      quiz.reset();
      showAnswer = false;
    });
  }

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
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AboutScreen.routeName),
            child: InfoWidget(
              text: AppStrings.about,
              color: Colors.red,
              fontSize: 18,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          Center(
            child: CustomCard(
                bodyWidget: Score(
                  score: quiz.score,
                  totalAttempted: quiz.totalAttempted,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor),
          ),
          CustomCard(
            headingWidget: Text(
              !showAnswer ? AppStrings.country : AppStrings.capital,
              style: Theme.of(context).textTheme.headline4,
            ),
            bodyWidget: Text(
              !showAnswer
                  ? countries.getCountry(quiz.currentIndex)
                  : countries.getCapital(quiz.currentIndex),
              style: Theme.of(context).textTheme.headline5,
            ),
            height: 350,
            onTapFunction: toggleShowAnswer,
            info: AppStrings.toggleCardMessage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: AppStrings.correct,
                backgroundColor: Colors.green,
                onPress: markAnswerAsCorrect,
              ),
              CustomButton(
                title: AppStrings.wrong,
                backgroundColor: Colors.red,
                onPress: markAnswerAsWrong,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                title: AppStrings.showResult,
                backgroundColor: Colors.blue,
                onPress: () {
                  Navigator.pushNamed(context, ResultScreen.routeName,
                          arguments: quiz)
                      .then((value) => resetQuiz());
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: resetQuiz,
        child: Text(AppStrings.reset),
      ),
    );
  }
}
