import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.lightBlue.shade50,
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.indigo),
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Colors.indigo,
        ),
      ));
}
