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
          child: Row(
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
              CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                // child: Text('AP'), // try this as well
                backgroundImage: AssetImage(
                    'images/bulb.jpg'), // you can try NetworkImage as well
                radius: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
