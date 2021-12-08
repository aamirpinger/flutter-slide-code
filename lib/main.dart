import 'package:flutter/cupertino.dart';
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

class Parent extends StatefulWidget {
  String value = "Hello from Parent Widget";

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  void updateState(String newValue) {
    setState(() => widget.value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return FirstChild(value: widget.value, updateState: updateState);
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild({required this.value, required this.updateState});

  final String value;
  final void Function(String) updateState;

  @override
  Widget build(BuildContext context) {
    return GrandChild(
      value: value,
      updateState: updateState,
    );
  }
}

class GrandChild extends StatelessWidget {
  const GrandChild({required this.value, required this.updateState});

  final String value;
  final void Function(String) updateState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          child: Text("Change value"),
          onPressed: () {
            updateState('State updated.');
          },
        )
      ],
    );
  }
}
