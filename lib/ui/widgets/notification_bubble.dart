import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationBubble extends StatelessWidget {
  NotificationBubble({
    this.sender = '',
    this.text = '',
    this.timestamp,
  });

  final String sender;
  final String text;
  final Timestamp? timestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          text,
        ),
        subtitle: Text('$sender @ ${timestamp?.toDate()}'),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
