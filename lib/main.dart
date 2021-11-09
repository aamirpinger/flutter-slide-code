import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DigitalClock());
}

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  final EdgeInsets paddingValue = EdgeInsets.all(7);
  final double containerSize = 150.0;
  final TextStyle fontStyle =
      TextStyle(fontSize: 72, color: Colors.white, fontWeight: FontWeight.bold);
  final BoxDecoration roundRadius = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.shade900,
    boxShadow: [
      BoxShadow(color: Colors.lightBlue, spreadRadius: 3),
    ],
  );

  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  int second = DateTime.now().second;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
      });
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Digital Clock'),
        ),
        backgroundColor: Colors.grey,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: paddingValue,
                  child: Container(
                    decoration: roundRadius,
                    height: containerSize,
                    child: Center(
                      child: Text(
                        hour.toString(),
                        style: fontStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: paddingValue,
                  child: Container(
                    decoration: roundRadius,
                    height: containerSize,
                    child: Center(
                      child: Text(
                        minute.toString(),
                        style: fontStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: paddingValue,
                  child: Container(
                    decoration: roundRadius,
                    height: containerSize,
                    child: Center(
                      child: Text(
                        second.toString(),
                        style: fontStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
