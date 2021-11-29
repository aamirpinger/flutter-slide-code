import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';

class NoticeBoardScreen extends StatefulWidget {
  static const routeName = '/notice_board';

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
      ),
      body: Text(
        'Notice board screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
