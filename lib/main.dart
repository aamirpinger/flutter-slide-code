import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:my_app/ui/screens/notice_board_app.dart';
import 'package:my_app/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NoticeBoardApp());
  CustomTheme.configEasyLoading();
}
