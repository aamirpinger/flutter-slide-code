import 'package:my_app/constants/configs.dart';

class Notice {
  Notice({required this.text, required this.sender, required this.timestamp});

  String text;
  String sender;
  DateTime timestamp;

  Notice.fromMap(Map snapshot)
      : text = snapshot[Configs.notificationField],
        sender = snapshot[Configs.emailField],
        timestamp = snapshot[Configs.timestampField].toDate();
}
