import 'package:flutter/material.dart';
import 'package:my_app/about_screen.dart';
import 'package:my_app/flash_card_app.dart';
import 'package:my_app/quiz.dart';
import 'package:my_app/result_screen.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FlashCardApp.routeName:
        return MaterialPageRoute(builder: (_) => FlashCard());

      case AboutScreen.routeName:
        return MaterialPageRoute(builder: (_) => AboutScreen());

      case ResultScreen.routeName:
        final args = settings.arguments as Quiz;
        return MaterialPageRoute(
          builder: (_) {
            return ResultScreen(
              score: args.score,
              totalAttempted: args.totalAttempted,
            );
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => FlashCard());
    }
  }
}
