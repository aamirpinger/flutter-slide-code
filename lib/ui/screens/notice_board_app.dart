import 'package:flutter/material.dart';
import 'package:my_app/core/services/loader_service.dart';
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
      builder: LoaderService.init(),
    );
  }
}
