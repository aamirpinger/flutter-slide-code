import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/screens/landing_screen.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';

abstract class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    AuthBase auth = Auth();
    Loader loaderService = LoaderService();

    switch (settings.name) {
      case NoticeBoardScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                NoticeBoardScreen(auth: auth, loaderService: loaderService));
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                LoginScreen(auth: auth, loaderService: loaderService));
      case SignupScreen.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                SignupScreen(auth: auth, loaderService: loaderService));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                LandingScreen(auth: auth, loaderService: loaderService));
    }
  }
}
