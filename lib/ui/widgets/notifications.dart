import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/modal/notice.dart';
import 'package:my_app/core/providers/auth_provider.dart';
import 'package:my_app/core/providers/loader_provider.dart';
import 'package:my_app/core/services/auth.dart';
import 'package:my_app/core/services/db_service.dart';
import 'package:my_app/core/services/loader_service.dart';
import 'package:my_app/ui/widgets/notification_bubble.dart';
import 'package:my_app/ui/widgets/text_notification.dart';

class Notifications extends ConsumerWidget {
  Notifications({required this.dbService});

  DBBase dbService;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Loader loaderService = ref.watch(loaderProvider);
    AuthBase auth = ref.watch(authProvider);
    // what is stream builder?
    // Widget that builds itself based on the latest snapshot of interaction with a Stream.
    return StreamBuilder<List<Notice>>(
      stream: dbService.getDataStream(),
      builder: (context, snapshot) {
        loaderService.dismiss();

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
