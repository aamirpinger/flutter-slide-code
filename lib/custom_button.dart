import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.backgroundColor,
    required this.onPress,
  });

  final String title;
  final Color backgroundColor;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
      onPressed: () => onPress(),
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
