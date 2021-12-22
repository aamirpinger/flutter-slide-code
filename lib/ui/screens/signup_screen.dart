import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    required this.auth,
    required this.loaderService,
  });

  static const routeName = '/signup';
  final AuthBase auth;
  final Loader loaderService;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = '';
  String password = '';
  String rePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.signup),
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
                obscureText: true,
              ),
              CustomTextField(
                onChange: (String value) => setState(() => rePassword = value),
                hintText: AppStrings.reEnterPassword,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      title: Text(AppStrings.register),
                      onPress: () async {
                        if (password == rePassword) {
                          await widget.auth
                              .singup(email: email, password: password);
                          Navigator.pop(context);
                        } else {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(ErrorStrings.error),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text(ErrorStrings.passwordIsNotSame),
                                    ],
                                  ),
                                ),
                                actions: [
                                  CustomButton(
                                    onPress: () => Navigator.pop(context),
                                    title: Text(AppStrings.close),
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  )
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                              );
                            },
                          );
                        }
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
