import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/core/services/auth_service.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/ui/screens/login_screen.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';
import 'package:my_app/ui/widgets/no_notifications.dart';
import 'package:my_app/ui/widgets/notification_bubble.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NoticeBoardScreen extends StatefulWidget {
  static const routeName = '/notice_board';

  @override
  _NoticeBoardScreenState createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  AuthService authService = AuthService();
  DBService dbService = DBService();
  TextEditingController inputFieldController = TextEditingController();

  String notification = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this helps show keyboard appear at top and do not affect other widgets
      resizeToAvoidBottomInset: true,
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
                  buttons: [
                    DialogButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppStrings.ok,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))
                  ]).show().whenComplete(
                  () => Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName,
                        (route) => false,
                      ));
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessagesStream(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextField(
                  controller: inputFieldController,
                  onChange: (value) {
                    setState(() {
                      notification = value;
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
                    dbService.addNotification(
                      notification,
                      authService.currentUser!.email!,
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

class MessagesStream extends StatelessWidget {
  AuthService authService = AuthService();
  DBService dbService = DBService();

  @override
  Widget build(BuildContext context) {
    // what is stream builder?
    // Widget that builds itself based on the latest snapshot of interaction with a Stream.
    return StreamBuilder<QuerySnapshot>(
      stream: dbService.getSnapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          EasyLoading.dismiss();
          return NoNotification();
        }

        final Iterable messages = snapshot.data!.docs;

        // fill all the notification into a List of NotificationBubble widget
        List<NotificationBubble> notificationBubbles = [];
        for (var message in messages) {
          final notificationBubble = NotificationBubble(
            text: message[Configs.notificationField],
            sender: message[Configs.emailField],
            timestamp: message[Configs.timestampField],
          );

          notificationBubbles.add(notificationBubble);
        }

        if (notificationBubbles.isNotEmpty) {
          return Expanded(
            child: ListView(
              // reverse: true,  // <-- this will be helpful to render data from bottom
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: notificationBubbles,
            ),
          );
        }

        return NoNotification();
      },
    );
  }
}
