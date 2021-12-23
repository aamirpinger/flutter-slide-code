import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/configs.dart';
import 'package:my_app/constants/error_strings.dart';
import 'package:my_app/core/modal/notice.dart';

abstract class DBBase {
  Future<String?> addNotification(String notification, String uid);
  Stream<List<Notice>> getDataStream();
}

class FireStoreService implements DBBase {
  static final FireStoreService instance = FireStoreService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory FireStoreService() {
    return instance;
  }

  FireStoreService._internal() {
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
  Stream<List<Notice>> getDataStream() async* {
    final Stream<QuerySnapshot<Map<String, dynamic>>> snap =
        _firestore.collection(Configs.notificationsCollection).snapshots();
    yield* snap.map(
      (event) => event.docs
          .map(
            (record) => Notice.fromMap(
              record.data(),
            ),
          )
          .toList(),
    );
  }
}
