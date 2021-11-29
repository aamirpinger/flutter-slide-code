import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  @override
  void initState() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.white
      ..indicatorColor = Colors.blue
      ..backgroundColor = Colors.white
      ..textColor = Colors.blue
      ..maskColor = Colors.blue.withOpacity(0)
      ..userInteractions = true
      ..dismissOnTap = false;

    // EasyLoading.show(status: AppStrings.loading);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Configs.logoImage),
              CustomTextField(
                onChange: (String value) => setState(() => email = value),
                hintText: AppStrings.enterEmail,
                leading: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
              ),
              CustomTextField(
                onChange: (String value) => setState(() => password = value),
                hintText: AppStrings.enterPassword,
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: Text(
                      AppStrings.signup,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPress: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      title: Text(AppStrings.login),
                      onPress: () {
                        Navigator.pushNamed(
                            context, NoticeBoardScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
