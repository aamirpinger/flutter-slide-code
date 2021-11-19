import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/dictionary_app.dart';
import 'package:my_app/ui/screens/dictionary_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DictionaryApp.routeName:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());

      default:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
    }
  }
}
