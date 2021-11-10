import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    this.headingWidget,
    this.bodyWidget,
    this.elevation = 20,
    this.height,
    this.backgroundColor,
    this.shadowColor,
  });

  final double? elevation;
  final Widget? headingWidget;
  final Widget? bodyWidget;
  final double? height;
  final Color? backgroundColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        child: Card(
          color: backgroundColor,
          shadowColor: shadowColor,
          elevation: elevation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: headingWidget),
              Container(child: bodyWidget)
            ],
          ),
        ),
      ),
    );
  }
}
