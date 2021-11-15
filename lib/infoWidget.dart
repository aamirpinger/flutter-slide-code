import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({
    required this.text,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = 15.0,
    this.color = Colors.red,
    this.fontSize = 16,
  });

  String text;
  MainAxisAlignment mainAxisAlignment;
  double padding;
  Color color;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Icon(
            Icons.info_outline,
            color: color,
            size: fontSize,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            // Flexible will help in case text overflows
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
