import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/utils/alert.dart';
import 'package:my_app/ui/screens/signup_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login';
  String email = '';
  String password = '';
  bool isLoading = false;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  AuthBase? auth;

  @override
  void initState() {
    auth = ref.read(authProvider);
  }

  Future<void> _login() async {
    try {
      print('clicked');
      setState(() {
        widget.isLoading = true;
      });

      await auth?.signInWithEmailPassword(
          email: widget.email, password: widget.password);
    } catch (e) {
      ShowAlert(
        context: context,
        bodyText: ErrorStrings.loginError,
        title: ErrorStrings.error,
      );
      _focusEmailInput();
      debugPrint(e.toString());
    } finally {
      setState(() {
        widget.isLoading = false;
      });
    }
  }

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _focusEmailInput() {
    FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                onEditingComplete: _emailEditingComplete,
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
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: true,
                focusNode: _passwordFocusNode,
                onEditingComplete: _login,
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
                        onPress: widget.isLoading ? null : _login),
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
