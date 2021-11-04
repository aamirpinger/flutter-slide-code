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
          child: Container(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            margin: EdgeInsets.only(left: 10, top: 20),
            color: Colors.deepOrange,
            width: 150,
            height: 70,
          ),
        ),
      ),
    );
  }
}
