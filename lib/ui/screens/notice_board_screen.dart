import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loaderService.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class NoticeBoardScreen extends StatefulWidget {
  NoticeBoardScreen({
    required this.auth,
    required this.loaderService,
    required this.dbService,
  });

  static const routeName = '/notice_board';
  final AuthBase auth;
  final Loader loaderService;
  final DBBase dbService;
  TextEditingController inputFieldController = TextEditingController();
  String notification = '';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: widget.inputFieldController,
                  onChange: (value) {
                    setState(() {
                      widget.notification = value;
                    });
                  },
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
                    widget.dbService.addNotification(
                      widget.notification,
                      widget.auth.currentUser!.email!,
                    );
                    widget.inputFieldController.clear();
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
