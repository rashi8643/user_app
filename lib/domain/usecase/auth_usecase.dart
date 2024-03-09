import 'package:flutter_task_user_app/domain/repository/auth_repository.dart';

final class LogInWithPhoneUseCase {
  final AuthenticationRepository repository;
  LogInWithPhoneUseCase({required this.repository});

  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw Exception('error');
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw Exception('Enter Phone number correctly');
    }
  }
}
