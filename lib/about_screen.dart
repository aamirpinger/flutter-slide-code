import 'package:flutter/material.dart';
import 'package:my_app/custom_button.dart';
import 'package:my_app/custom_card.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
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
                'This app is developed during the flutter course by Aamir Pinger.',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CustomButton(
            title: 'Return Back',
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
