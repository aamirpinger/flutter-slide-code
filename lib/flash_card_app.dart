import 'package:flutter/material.dart';
import 'package:my_app/about_screen.dart';
import 'package:my_app/infoWidget.dart';
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
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue.shade50,
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.indigo),
          textTheme: TextTheme(
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Colors.black,
            ),
            headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Colors.indigo,
            ),
          )),
      // theme: ThemeData.dark(),
      // home: FlashCard(), //  <---- we cannot use home and initial route together
      initialRoute: '/',
      routes: {
        '/': (context) => FlashCard(),
        '/about': (context) => AboutScreen(),
      },
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
      // backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text('Guess the Capital City'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/about'),
            child: InfoWidget(
              text: 'ABOUT',
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
              !showAnswer ? 'Country:' : 'Capital',
              style: Theme.of(context).textTheme.headline4,
            ),
            bodyWidget: Text(
              !showAnswer
                  ? countries.getCountry(quiz.currentIndex)
                  : countries.getCapital(quiz.currentIndex),
              style: Theme.of(context).textTheme.headline5,
            ),
            height: 400,
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
