import 'package:flutter/material.dart';
import 'package:my_app/ui/routes.dart';
import 'package:my_app/ui/theme.dart';

class FlashCardApp extends StatelessWidget {
  const FlashCardApp({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      // theme: ThemeData.dark(),
      // home: FlashCard(), //  <---- we cannot use home and initial route together
      initialRoute: FlashCardApp.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
