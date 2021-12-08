import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Parent(),
        ),
      ),
    ),
  );
}

class Parent extends StatelessWidget {
  String value = "Hello from Parent Widget";

  @override
  Widget build(BuildContext context) {
    return FirstChild(value: value);
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return GrandChild(value: value);
  }
}

class GrandChild extends StatelessWidget {
  const GrandChild({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48,
        color: Colors.red,
      ),
    );
  }
}
