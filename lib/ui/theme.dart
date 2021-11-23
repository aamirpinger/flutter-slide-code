import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      primaryColor: Colors.amber,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade900),
      cardTheme: CardTheme(
          color: Colors.blueGrey.shade900,
          shadowColor: Colors.grey,
          elevation: 30),
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Colors.indigo,
        ),
      ));
}
