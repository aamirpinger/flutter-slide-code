import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class CustomTheme {
  static Color primaryColor = Color(0xFF050A30);

  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CustomTheme.primaryColor,
      colorScheme: ColorScheme.light(secondary: Colors.amber),
      appBarTheme: AppBarTheme(
        backgroundColor: CustomTheme.primaryColor,
      ),
      cardTheme: CardTheme(
          color: Colors.blueGrey.shade900,
          shadowColor: Colors.grey,
          elevation: 30),
      textTheme: TextTheme(
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: CustomTheme.primaryColor,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: CustomTheme.primaryColor,
        ),
      ));
}
