import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/providers/loader_provider.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loader_service.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/screens/notice_board_screen.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    required this.dbService,
  });

  static const routeName = '/';
  final DBBase dbService;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStreamProvider.stream);
    final Loader loaderService = ref.watch(loaderProvider);

    return StreamBuilder<User?>(
        stream: _authState,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            loaderService.dismiss();
            final User? user = snapshot.data;
            print(user?.email);
            if (user == null) {
              return LoginScreen();
            }

            return NoticeBoardScreen(dbService: dbService);
          }

          loaderService.show(message: AppStrings.loading);
          return Container();
        });
  }
}
