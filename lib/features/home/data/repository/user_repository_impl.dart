import 'package:flutter_task_user_app/features/home/data/data_source/data_souce.dart';
import 'package:flutter_task_user_app/features/home/data/data_source/data_source_impl.dart';
import 'package:flutter_task_user_app/features/home/data/model/model.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/domain/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final UserFirestoreDataSource dataSource;

  UserRepositoryImpl({
    required this.dataSource,
  });

  ///add todo
  @override
  Future<void> addUser(UserEntity user) async {
    final addUser = Model(
      title: user.title,
      isChecked: user.isChecked,
    );
    await dataSource.addUser(addUser);
  }

  ///delete todo
  @override
  Future<void> deleteUser(String id) async {
    await dataSource.deleteUser(id);
  }

  ///get todo
  @override
  Stream<List<UserEntity>> getUser() async* {
    final dataStream = dataSource.getUser();
    await for (final snapshot in dataStream) {
      final modelsList = snapshot.docs;
      yield [
        for (final model in modelsList)
          UserEntity(
              id: model.id,
              title: model.data().title,
              isChecked: model.data().isChecked)
      ];
    }
  }

  ///update todo
  @override
  Future<void> updateUser(UserEntity user) async {
    await dataSource.updateUser(
      Model(title: user.title, isChecked: user.isChecked),
      user.id,
    );
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
    dataSource: ref.watch(userFirestoreDataSourceProvider),
  );
}
