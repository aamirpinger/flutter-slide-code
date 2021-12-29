import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/ui/theme.dart';

abstract class Loader {
  void show({required String message});
  void dismiss();
}

class LoaderService implements Loader {
  @override
  void dismiss() {
    EasyLoading.dismiss();
  }

  @override
  void show({required String message}) {
    EasyLoading.show(status: message);
  }

  static void configEasyLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.white
      ..indicatorColor = CustomTheme.primaryColor
      ..backgroundColor = Colors.white
      ..textColor = CustomTheme.primaryColor
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static Widget Function(BuildContext, Widget?) init() => EasyLoading.init();
}
