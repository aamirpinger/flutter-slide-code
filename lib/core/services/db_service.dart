import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';

abstract class DBBase {
  Future<String?> addNotification(String notification, String uid);

  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshots();
}

class DBService implements DBBase {
  static final DBService instance = DBService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory DBService() {
    return instance;
  }

  DBService._internal() {
    // This method could be use to set initial values if any.
  }

  @override
  Future<String?> addNotification(String notification, String email) async {
    try {
      final response =
          await _firestore.collection(Configs.notificationsCollection).add({
        Configs.notificationField: notification,
        Configs.emailField: email,
        Configs.timestampField: DateTime.now(),
      });

      if (response.id == null) {
        throw Exception(ErrorStrings.unableToAdd);
      }

      return response.id;
    } catch (e) {
      debugPrint('${ErrorStrings.someThingWrong}: $e');
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshots() =>
      _firestore.collection(Configs.notificationsCollection).snapshots();
}
