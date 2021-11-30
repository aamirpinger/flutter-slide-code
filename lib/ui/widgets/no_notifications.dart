import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.noNotifications,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
