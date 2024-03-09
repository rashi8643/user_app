import 'package:flutter_task_user_app/data/data_source/firebase_auth_datasource.dart';
import 'package:flutter_task_user_app/data/data_source/firebase_auth_datasource_impl.dart';
import 'package:flutter_task_user_app/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FireBaseAuthentication datasource;
  AuthenticationRepositoryImpl({required this.datasource});
  @override
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await datasource.loginWithPhone(phone);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await datasource.verifyOtp(verificationId, otp);
  }

  @override
  Future<void> signOut() async {
    await datasource.signout();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      datasource: ref.watch(firebaseAuthenticationProvider));
}
