import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/modal/notice.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/ui/widgets/text_notification.dart';
import 'package:my_app/ui/widgets/notification_bubble.dart';

class Notifications extends StatelessWidget {
  Notifications({required this.authService, required this.dbService});

  AuthBase authService;
  DBBase dbService;

  @override
  Widget build(BuildContext context) {
    // what is stream builder?
    // Widget that builds itself based on the latest snapshot of interaction with a Stream.
    return StreamBuilder<List<Notice>>(
      stream: dbService.getDataStream(),
      builder: (context, snapshot) {
        EasyLoading.dismiss();

        if (snapshot.hasData) {
          final children = snapshot.data!
              .map(
                (notice) => NoticeBubble(
                  notice: notice,
                ),
              )
              .toList();
          return ListView(children: children);
        } else if (snapshot.hasError) {
          return TextNotification(
            text: ErrorStrings.someThingWrong,
          );
        }

        return TextNotification();
      },
    );
  }
}
