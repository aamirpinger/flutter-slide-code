import 'package:flutter/material.dart';
import 'package:my_app/core/class/quiz.dart';
import 'package:my_app/ui/screens/about_screen.dart';
import 'package:my_app/ui/screens/flash_card_app.dart';
import 'package:my_app/ui/screens/flash_card_screen.dart';
import 'package:my_app/ui/screens/result_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FlashCardApp.routeName:
        return MaterialPageRoute(builder: (_) => FlashCardScreen());

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
        return MaterialPageRoute(builder: (_) => FlashCardScreen());
    }
  }
}
