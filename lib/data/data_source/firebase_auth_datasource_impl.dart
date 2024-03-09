import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task_user_app/data/data_source/firebase_auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_datasource_impl.g.dart';

class FireBaseAuthenticationImpl implements FireBaseAuthentication {
  final FirebaseAuth _auth;
  FireBaseAuthenticationImpl(this._auth);

  @override
  Future<(String, int?)> loginWithPhone(String phone,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String? verificationId, int? resendToken) async {
          verificationIdCompleter.complete(verificationId);
          resendTokenCompleter.complete(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );

      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;

      return (verificationId, newResendToken);
    } on Exception {
      throw Exception(
        'cannot login',
      );
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signout() async {
    await _auth.signOut();
  }
}

@riverpod
FireBaseAuthentication firebaseAuthentication(FirebaseAuthenticationRef ref) {
  return FireBaseAuthenticationImpl(FirebaseAuth.instance);
}
