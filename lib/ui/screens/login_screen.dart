import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  AuthService authService = AuthService();

  Future<void> login() async {
    if (email.isEmpty || password.isEmpty) {
      Alert(
        context: context,
        title: ErrorStrings.errorAlert,
        desc: ErrorStrings.enterValidCredentials,
      ).show();

      return;
    }

    EasyLoading.show(status: AppStrings.loading);
    User? loggedInUser = await authService.login(email, password);
    EasyLoading.dismiss();

    if (loggedInUser != null) {
      Navigator.pushNamed(context, NoticeBoardScreen.routeName);
    } else {
      Alert(
        context: context,
        title: ErrorStrings.errorAlert,
        desc: ErrorStrings.userNotFound,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: true,
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
                obscureText: true,
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
                      onPress: login,
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
