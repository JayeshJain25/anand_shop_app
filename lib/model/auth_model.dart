import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/login_provider.dart';
import '../widget/common_widget.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  //  SigIn the user using Email and Password
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
    Reader read,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user!.uid;
    } on FirebaseAuthException {
      read(loginLoadingProvider.notifier).change(false);
      toast(text: "The email address or password is incorrect");
    }
    return "";
  }

  // SignUp the user using Email and Password
  Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
    Reader read,
  ) async {
    try {
      UserCredential userData = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userData.user!.uid;
    } on FirebaseAuthException catch (e) {
      read(signUpLoadingProvider.notifier).change(false);
      if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        toast(text: 'Email is already in use.');
      }
    } catch (e) {
      if (e ==
          'I/flutter (22197): [firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        toast(text: 'Email is already in use.');
      }
    }
    return "";
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
