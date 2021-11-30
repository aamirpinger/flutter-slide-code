import 'package:flutter/material.dart';

abstract class CustomTheme {
  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xFF050A30),
      colorScheme: ColorScheme.light(secondary: Colors.amber),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF050A30),
      ),
      cardTheme: CardTheme(
          color: Colors.blueGrey.shade900,
          shadowColor: Colors.grey,
          elevation: 30),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xFF050A30),
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xFF050A30),
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Color(0xFF050A30),
        ),
      ));
}
