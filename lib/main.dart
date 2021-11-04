import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Flutter App'),
          backgroundColor: Colors.deepOrange,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // verticalDirection: VerticalDirection.up, // try this
            // mainAxisSize: MainAxisSize.min, // try this
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  'Idea!!!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                color: Colors.lightBlue,
              ),
              Image(
                image: AssetImage('images/bulb.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
