import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';

final class DeleteUserUsecase {
  final UserRepository repository;

  DeleteUserUsecase({required this.repository});

  Future<void> call({required String id}) async {
    try {
      if (id.trim().isEmpty) {
        throw Exception("Title should not be empty. Try again");
      }

      await repository.deleteUser(id);
    } catch (e) {
      throw Exception('Cannot Delete Todo');
    }
  }
}
