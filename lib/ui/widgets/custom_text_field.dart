import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.onChange,
  });

  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          icon: Icon(
            Icons.text_fields,
            color: Colors.white,
            size: 32,
          ),
          hintText: AppStrings.enterWordHere,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          onChange(value);
          print(value);
        },
      ),
    );
  }
}
