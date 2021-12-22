import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    required this.auth,
    required this.loaderService,
  });

  static const routeName = '/login';
  final AuthBase auth;
  final Loader loaderService;
  String email = '';
  String password = '';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _login() async {
    try {
      await widget.auth.signInWithEmailPassword(
          email: widget.email, password: widget.password);
    } catch (e) {
      debugPrint(e.toString());
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
                onChange: (String value) =>
                    setState(() => widget.email = value),
                hintText: AppStrings.enterEmail,
                leading: Icon(
                  Icons.email_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
              ),
              CustomTextField(
                onChange: (String value) =>
                    setState(() => widget.password = value),
                hintText: AppStrings.enterPassword,
                leading: Icon(
                  Icons.password_outlined,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  size: 32,
                ),
                obscureText: true,
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
                      onPress: _login,
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
