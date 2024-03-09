import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';

final class GetUserUsecase {
  final UserRepository repository;
  GetUserUsecase({required this.repository});

  Stream<List<UserEntity>> call() async* {
    try {
      final todoStream = repository.getUser();
      await for (final todos in todoStream) {
        for (final todo in todos) {
          if (todo.title.trim().isEmpty) {
            throw Exception('Title should not be empty. Try again');
          }
        }
        yield todos;
      }
    } catch (e) {
      throw Exception('Cannot Get Todo');
    }
  }
}
