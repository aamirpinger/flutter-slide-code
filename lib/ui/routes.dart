import 'package:flutter/material.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/screens/about_screen.dart';
import 'package:my_app/ui/screens/landing_screen.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Loader loaderService = LoaderService();
    DBBase fireStoreService = FireStoreService();

    switch (settings.name) {
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => NoticeBoardScreen(
                  loaderService: loaderService,
                  dbService: fireStoreService,
                ));
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(loaderService: loaderService));
      case SignupScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => SignupScreen(loaderService: loaderService));
      case AboutScreen.routeName:
        return MaterialPageRoute(
            settings: RouteSettings(name: AboutScreen.routeName),
            builder: (_) => AboutScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => LandingScreen(
                  loaderService: loaderService,
                  dbService: fireStoreService,
                ));
    }
  }
}
