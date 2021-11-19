import 'package:flutter/material.dart';
import 'package:my_app/constant/app_strings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showEOLAlert(
  BuildContext context,
) =>
    Alert(
      context: context,
      title: AppStrings.alert,
      desc: AppStrings.endOfListMessage,
    ).show();
