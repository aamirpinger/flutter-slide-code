import 'package:flutter/material.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/ui/screens/about_screen.dart';
import 'package:my_app/ui/screens/landing_screen.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    DBBase fireStoreService = FireStoreService();

    switch (settings.name) {
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => NoticeBoardScreen(
                  dbService: fireStoreService,
                ));
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case AboutScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: AboutScreen.routeName),
            builder: (_) => AboutScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => LandingScreen(
                  dbService: fireStoreService,
                ));
    }
  }
}
