import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/ui/routes.dart';
import 'package:my_app/ui/screens/landing_screen.dart';
import 'package:my_app/ui/theme.dart';

class NoticeBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      initialRoute: LandingScreen.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
      builder: EasyLoading.init(),
    );
  }
}
