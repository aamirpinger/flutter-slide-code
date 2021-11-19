import 'package:flutter/material.dart';
import 'package:my_app/constant/app_strings.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_card.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.aboutScreen),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCard(
            height: 300,
            bodyWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.aboutApp.toUpperCase(),
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CustomButton(
            title: AppStrings.returnBack,
            backgroundColor: Colors.blue,
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
