import 'package:flutter/material.dart';
import 'package:my_app/ui/routes.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NoticeBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
      builder: EasyLoading.init(),
    );
  }
}
