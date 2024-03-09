import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';

final class AddUserUsecase {
  final UserRepository repository;

  AddUserUsecase({required this.repository});

  Future<void> call({
    required String title,
    required bool isChecked,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw Exception(' Title should not be empty. Try again');
      }

      final user = UserEntity(
        id: '',
        title: title,
        isChecked: isChecked,
      );
      await repository.addUser(user);
    } catch (e) {
      throw Exception("Cannot add todo. Please try again");
    }
  }
}
