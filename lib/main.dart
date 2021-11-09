import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print('Text button is pressed');
                },
                onLongPress: () {
                  print('Long pressed');
                },
                style: TextButton.styleFrom(
                  primary: Colors.red,
                  textStyle: TextStyle(fontSize: 24),
                ),
                child: Text('Text button'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Elevated button 1 is pressed.');
                },
                child: Text('Elevated button 1'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Elevated button 2 is pressed.');
                },
                child: Text('Elevated button 2'),
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black;
                  }
                  return Colors.teal; // Defer to the widget's default.
                })),
              ),
              OutlinedButton(
                onPressed: () {
                  print('Outlined button Pressed');
                },
                child: Text('Outlined button'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.purpleAccent),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.volume_up),
                iconSize: 48,
                onPressed: () {
                  print('Icon button is pressed');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.blueAccent,
          backgroundColor: Colors.yellow,
          onPressed: () {
            print("Floating button clicked!");
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
