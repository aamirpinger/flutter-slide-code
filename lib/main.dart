import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/services/loader_service.dart';

import 'package:my_app/ui/screens/notice_board_app.dart';
import 'package:my_app/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: NoticeBoardApp(),
    ),
  );
  LoaderService.configEasyLoading();
}
