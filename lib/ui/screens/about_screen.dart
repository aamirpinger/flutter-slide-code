import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/utils/alert.dart';
import 'package:my_app/ui/widgets/custom_button.dart';

class AboutScreen extends ConsumerWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthBase auth = ref.watch(authProvider);
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
              auth.signOut();
              EasyLoading.dismiss();
              ShowAlert(
                context: context,
                bodyText: AppStrings.signOutSuccess,
                title: AppStrings.appTitle,
              );
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
            ),
          ],
        ),
      ),
    );
  }
}
