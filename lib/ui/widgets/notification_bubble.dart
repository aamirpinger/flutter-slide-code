import 'package:flutter/material.dart';
import 'package:my_app/constants/app_strings.dart';
import 'package:my_app/core/modal/notice.dart';

class NoticeBubble extends StatelessWidget {
  NoticeBubble({
    required this.notice,
  });

  final Notice notice;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          notice.text,
          style: Theme.of(context).textTheme.headline4,
        ),
        subtitle: Row(
          children: [
            Text(
              notice.sender,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            Text(AppStrings.textSeparator),
            Text(
              notice.timestamp.toString(),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
