import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextStyle getTextStyle(
  FontWeight fontWeight,
  double fontSize,
  Color fontColor,
) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );

void showEOLAlert(
  BuildContext context,
) =>
    Alert(
      context: context,
      title: "ALERT",
      desc: "You have already reached to the end of list.",
    ).show();
