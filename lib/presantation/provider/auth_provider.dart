import 'package:flutter/material.dart';
import 'package:flutter_task_user_app/core/utils/snackbar_utils.dart';
import 'package:flutter_task_user_app/data/repository/auth_repository_impl.dart';
import 'package:flutter_task_user_app/domain/repository/auth_repository.dart';
import 'package:flutter_task_user_app/domain/usecase/auth_usecase.dart';
import 'package:flutter_task_user_app/domain/usecase/logout_usecase.dart';
import 'package:flutter_task_user_app/domain/usecase/otp_usecase.dart';
import 'package:flutter_task_user_app/presantation/pages/home_pages.dart';
import 'package:flutter_task_user_app/presantation/pages/login_page.dart';
import 'package:flutter_task_user_app/presantation/pages/otp_verificcation_page.dart';
import 'package:flutter_task_user_app/presantation/provider/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;

  @override
  AuthState build() {
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData = await LogInWithPhoneUseCase(
          repository: ref.read(authenticationRepositoryProvider))(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpVerificationPage(),
          )));
    } on Exception catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, 'Error'));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(
              repository: ref.read(authenticationRepositoryProvider))(
          state.verificationId, otp);
      Future.sync(
        () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        ),
      );
    } on Exception catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, 'Error'));
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await LogOutUseCase(
          repository: ref.read(authenticationRepositoryProvider))();
      Future.sync(() => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          )));
    } on Exception catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, 'Error'));
    }
  }
}
