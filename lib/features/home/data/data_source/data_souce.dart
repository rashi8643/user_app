import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task_user_app/features/home/data/model/model.dart';

abstract class UserFirestoreDataSource {
  Future<void> addUser(Model user);
  Future<void> updateUser(Model user, String id);
  Future<void> deleteUser(String id);
  Stream<QuerySnapshot<Model>> getUser();
}
