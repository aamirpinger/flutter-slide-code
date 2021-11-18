import 'package:flutter/material.dart';
import 'package:my_app/custom_button.dart';
import 'package:my_app/custom_card.dart';
import 'package:my_app/score.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({required this.score, required this.totalAttempted});

  static const routeName = '/result';

  final int score;
  final int totalAttempted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false, // to hide the back button
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(
            height: 300,
            headingWidget: Text(
              'Quiz Ended :',
              style: Theme.of(context).textTheme.headline4,
            ),
            bodyWidget: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Score(
                score: score,
                totalAttempted: totalAttempted,
                textStyle: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          CustomButton(
            title: 'Restart',
            backgroundColor: Colors.blue,
            onPress: () {
              Navigator.pop(context, {"name": "aamir"});
            },
          ),
        ],
      ),
    );
  }
}
