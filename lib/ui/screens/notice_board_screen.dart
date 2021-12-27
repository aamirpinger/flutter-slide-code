import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';
import 'package:my_app/ui/widgets/drawer_menu.dart';
import 'package:my_app/ui/widgets/notifications.dart';

class NoticeBoardScreen extends ConsumerWidget {
  NoticeBoardScreen({
    required this.loaderService,
    required this.dbService,
  });

  static const routeName = '/notice_board';

  final Loader loaderService;
  final DBBase dbService;
  TextEditingController inputFieldController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthBase auth = ref.watch(authProvider);
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: true,
      drawer: DrawerMenu(),
      appBar: AppBar(
        // leading: null,
        // automaticallyImplyLeading: false,
        title: Text(AppStrings.appTitle),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.logout),
            onTap: auth.signOut,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Notifications(
              authService: auth,
              dbService: dbService,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: inputFieldController,
                  onChange: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Icon(
                    Icons.add,
                    size: 32,
                  ),
                  onPress: () {
                    dbService.addNotification(
                      inputFieldController.value.text,
                      auth.currentUser!.email!,
                    );
                    inputFieldController.clear();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
