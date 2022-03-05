import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/audio_player_screen.dart';
import 'package:my_app/ui/screens/dictionary_app.dart';
import 'package:my_app/ui/screens/dictionary_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DictionaryApp.routeName:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
      case AudioPlayerScreen.routeName:
        final args = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AudioPlayerScreen(url: args));
      default:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
    }
  }
}
