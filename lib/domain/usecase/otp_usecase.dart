import 'package:flutter_task_user_app/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthenticationRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw Exception();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw Exception('Enter your otp correctly,try again');
    }
  }
}
