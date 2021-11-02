import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('My Flutter App'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Image(
            image: NetworkImage('https://i.gifer.com/4Cb2.gif', scale: 2.5),
          ),
        ),
      ),
    ),
  );
}
