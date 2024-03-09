import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';

final class UpdateUserUsecase {
  final UserRepository repository;

  UpdateUserUsecase({required this.repository});

  Future<void> call({
    required String title,
    required bool isChecked,
    required String id,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw Exception("Title should not be empty. Try again");
      }

      final user = UserEntity(
        id: id,
        title: title,
        isChecked: isChecked,
      );
      await repository.updateUser(user);
    } catch (e) {
      throw Exception('Cannot Update Todo');
    }
  }
}
