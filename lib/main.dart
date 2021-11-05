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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('images/bulb.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
                width: 250,
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
