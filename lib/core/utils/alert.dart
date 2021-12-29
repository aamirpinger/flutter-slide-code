import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/ui/widgets/custom_button.dart';

Future<void> ShowAlert({
  required BuildContext context,
  required String bodyText,
  required String title,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          CustomButton(
            onPress: () => Navigator.pop(context),
            title: Text(AppStrings.close),
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
    },
  );
}
