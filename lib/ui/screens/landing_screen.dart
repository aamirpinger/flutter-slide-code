import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    required this.auth,
    required this.loaderService,
    required this.dbService,
  });

  static const routeName = '/';
  final AuthBase auth;
  final Loader loaderService;
  final DBBase dbService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            loaderService.dismiss();
            final User? user = snapshot.data;
            print(snapshot.data);
            if (user == null) {
              return LoginScreen(auth: auth, loaderService: loaderService);
            }

            return NoticeBoardScreen(
              auth: auth,
              loaderService: loaderService,
              dbService: dbService,
            );
          }

          loaderService.show(message: AppStrings.loading);

          return Container();
        });
  }
}
