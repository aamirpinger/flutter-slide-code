import 'package:flutter/material.dart';
import 'package:my_app/ui/screens/about_screen.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/screens/splash_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(
            // to modalRoute to setting route name, we need to add settings parameter at routes
            settings: RouteSettings(name: NoticeBoardScreen.routeName),
            builder: (_) => NoticeBoardScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: LoginScreen.routeName),
            builder: (_) => LoginScreen());
      case SignupScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: SignupScreen.routeName),
            builder: (_) => SignupScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: SplashScreen.routeName),
            builder: (_) => SplashScreen());
      case AboutScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: AboutScreen.routeName),
            builder: (_) => AboutScreen());

      default:
        return MaterialPageRoute(
            settings: RouteSettings(name: LoginScreen.routeName),
            builder: (_) => LoginScreen());
    }
  }
}
