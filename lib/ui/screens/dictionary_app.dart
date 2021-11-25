import 'package:flutter/material.dart';
import 'package:my_app/ui/routes.dart';
import 'package:my_app/ui/theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.theme,
      initialRoute: DictionaryApp.routeName,
      onGenerateRoute: CustomRoutes.generateRoute,
      builder: EasyLoading.init(),
    );
  }
}
