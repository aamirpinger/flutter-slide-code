import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/screens/splash_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(builder: (_) => NoticeBoardScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
