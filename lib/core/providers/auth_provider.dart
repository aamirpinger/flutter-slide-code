import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/services/auth.dart';

final authProvider = Provider<AuthBase>(
  (ref) => Auth(),
);

final authStreamProvider = StreamProvider<User?>(
  (ref) => Auth().authStateChanges(),
);
