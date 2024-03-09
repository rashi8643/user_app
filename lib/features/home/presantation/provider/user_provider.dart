import 'package:flutter/material.dart';
import 'package:flutter_task_user_app/features/home/data/data_source/data_source_impl.dart';
import 'package:flutter_task_user_app/features/home/data/repository/user_repository_impl.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';
import 'package:flutter_task_user_app/features/home/domain/usecase/add_user_usecase.dart';
import 'package:flutter_task_user_app/features/home/domain/usecase/delete_user_usecase.dart';
import 'package:flutter_task_user_app/features/home/domain/usecase/get_user_usercase.dart';
import 'package:flutter_task_user_app/features/home/domain/usecase/update_user_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class UserState extends _$UserState {
  late final TextEditingController titleController;
  late UserRepository repository;

  @override
  void build() {
    titleController = TextEditingController();
    repository = ref.watch(userRepositoryProvider);

    ref.onDispose(dispose);
  }

  void dispose() {
    titleController.dispose();
  }

  /// Update User
  Future<String?> updateUser({
    required String id,
    required bool isChecked,
  }) async {
    try {
      final newTitle = titleController.text;
      await UpdateUserUsecase(repository: repository)(
        id: id,
        isChecked: isChecked,
        title: newTitle,
      );
    } on Exception catch (e) {
      return 'Error';
    } catch (e) {
      throw Exception('Unknown error occured');
    }

    return null;
  }

  /// Check User
  Future<String?> checkUser(String todoId, bool isChecked, String title) async {
    try {
      await UpdateUserUsecase(repository: repository)(
        id: todoId,
        isChecked: isChecked,
        title: title,
      );
    } on Exception catch (e) {
      return 'Error';
    } catch (e) {
      throw Exception('Unknown error occured');
    }

    return null;
  }

  /// Add User
  Future<String?> addUser() async {
    try {
      final title = titleController.text;
      await AddUserUsecase(repository: repository)(
          title: title, isChecked: false);
    } on Exception catch (e) {
      return 'Error';
    } catch (e) {
      throw Exception('Unknown error occured');
    }

    return null;
  }

  /// Delete User
  Future<String?> deleteUser(String id) async {
    try {
      await DeleteUserUsecase(repository: repository)(id: id);
    } on Exception catch (e) {
      return 'Error';
    } catch (e) {
      throw Exception('Unknown error occured');
    }

    return null;
  }
}

///get User
@riverpod
Stream<List<UserEntity>> user(UserRef ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUserUsecase(repository: repository)();
}
