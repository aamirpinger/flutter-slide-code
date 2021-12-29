import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/providers/loader_provider.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/loader_service.dart';

import 'alert.dart';

void signout(BuildContext context, WidgetRef ref) async {
  AuthBase auth = ref.read(authProvider);
  Loader loaderService = ref.read(loaderProvider);
  loaderService.show(message: AppStrings.loading);
  await auth.signOut();
  loaderService.dismiss();
  Navigator.pushNamedAndRemoveUntil(
      context, Navigator.defaultRouteName, (route) => true);
  ShowAlert(
    context: context,
    bodyText: AppStrings.signOutSuccess,
    title: AppStrings.appTitle,
  );
}
