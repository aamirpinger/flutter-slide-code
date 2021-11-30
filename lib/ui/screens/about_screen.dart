import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // leading: null,
        // automaticallyImplyLeading: false,
        title: Text(AppStrings.appTitle),
        centerTitle: true,
        actions: [
          CustomButton(
            backgroundColor: Theme.of(context).primaryColor,
            title: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPress: () {
              EasyLoading.show(status: AppStrings.loading);
              authService.signOut();
              EasyLoading.dismiss();

              Alert(
                  context: context,
                  title: AppStrings.appTitle,
                  desc: AppStrings.signOutSuccess,
                  type: AlertType.success,
                  buttons: [
                    DialogButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.ok,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))
                  ]).show().whenComplete(
                  () => Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName,
                        (route) => false,
                      ));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: Configs.logoImage,
              child: Image.asset(
                Configs.logoImage,
                width: 100,
                height: 100,
              ),
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AnimatedTextKit(
                repeatForever: false,
                animatedTexts: [
                  TypewriterAnimatedText(AppStrings.aboutText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
