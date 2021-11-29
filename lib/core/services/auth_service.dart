import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/error_strings.dart';

abstract class AuthBase {
  Future<void> createUser(String email, String password);
  Future<void> login(String email, String password);

  User? get currentUser;

  Future<void> signOut();
}

class AuthService implements AuthBase {
  static final AuthService instance = AuthService._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  factory AuthService() {
    return instance;
  }

  AuthService._internal() {
    // This method could be use to set initial values if any.
  }

  @override
  Future<User?> createUser(String email, String password) async {
    try {
      final UserCredential signupResponse = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (signupResponse.user == null) {
        throw Exception(ErrorStrings.userCreationFailed);
      }

      return signupResponse.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == ErrorStrings.emailExists) {
        return null;
      } else {
        debugPrint('${ErrorStrings.someThingWrong} - ${e.code}');
        rethrow;
      }
    } catch (e) {
      debugPrint('${ErrorStrings.someThingWrong}: $e');
      rethrow;
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final UserCredential signinResponse = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (signinResponse.user == null) {
        throw Exception(ErrorStrings.loginError);
      }

      return signinResponse.user;
    } catch (e) {
      debugPrint('${ErrorStrings.someThingWrong}: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  User? get currentUser {
    return _auth.currentUser;
  }
}
