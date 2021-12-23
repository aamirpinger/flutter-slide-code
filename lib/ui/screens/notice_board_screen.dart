import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/loaderService.dart';

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({
    required this.auth,
    required this.loaderService,
  });

  static const routeName = '/notice_board';
  final AuthBase auth;
  final Loader loaderService;

  @override
  _NoticeBoardScreenState createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
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
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: widget.auth.signOut,
          ),
        ],
      ),
      body: Text(
        AppStrings.appTitle,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
