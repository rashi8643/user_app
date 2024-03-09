import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity todo);
  Future<void> updateUser(UserEntity todo);
  Future<void> deleteUser(String id);
  Stream<List<UserEntity>> getUser();
}
