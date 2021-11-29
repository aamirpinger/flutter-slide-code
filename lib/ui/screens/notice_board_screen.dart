import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NoticeBoardScreen extends StatefulWidget {
  static const routeName = '/notice_board';

  @override
  _NoticeBoardScreenState createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
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
              ).show();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
      body: Text(
        'Notice board screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
