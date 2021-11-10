import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'countries.dart';

void main() {
  runApp(FlashCardApp());
}

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
  int index = 0;
  int score = 0;
  int totalAttempted = 0;
  bool showAnswer = false;
  bool showAlert = false;

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
            child: Text(
              'Score: $score / $totalAttempted',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !showAnswer ? 'Country:' : 'Capital',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                    ),
                    Text(
                      !showAnswer
                          ? countries[index]['country']!
                          : countries[index]['city']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.indigo),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAnswer = !showAnswer;
                  });
                },
                child: Text(
                  'Show ${showAnswer ? 'Question' : 'Answer'}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  setState(() {
                    if (index < countries.length - 1) {
                      index++;
                      score++;
                      totalAttempted++;
                    } else {
                      Alert(
                        context: context,
                        title: "ALERT",
                        desc: "You have already reached to the end of list.",
                      ).show();
                    }
                  });
                },
                child: Text(
                  'Correct',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  setState(() {
                    if (index < countries.length - 1) {
                      index++;
                      totalAttempted++;
                    } else {
                      Alert(
                        context: context,
                        title: "ALERT",
                        desc: "You have already reached to the end of list.",
                      ).show();
                    }
                  });
                },
                child: Text(
                  'Wrong',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 0;
            totalAttempted = 0;
            score = 0;
            showAnswer = false;
          });
        },
        child: Text('Reset'),
      ),
    );
  }
}
