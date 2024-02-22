import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firebaseuasathservice {
  final FirebaseAuth _fbauth = FirebaseAuth.instance;

  Future<UserCredential?> registerAkun({
    required String email,
    required String password,
  }) async {
    var user = await _fbauth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  Future loginakun({
    required String email,
    required String password,
  }) async {
    var user = await _fbauth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }

  Future logout() async {
    _fbauth.signOut();
    var box = Hive.box('userBox');
    box.clear();
  }
}
