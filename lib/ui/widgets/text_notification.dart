import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class TextNotification extends StatelessWidget {
  TextNotification({this.text = ''});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
