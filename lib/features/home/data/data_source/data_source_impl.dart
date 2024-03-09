import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task_user_app/features/home/data/data_source/data_souce.dart';
import 'package:flutter_task_user_app/features/home/data/model/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_source_impl.g.dart';

class UserFirestoreDataSourceImpl implements UserFirestoreDataSource {
  final firestore = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser!.uid;
  final collection = FirebaseFirestore.instance.collection(user).withConverter(
        fromFirestore: Model.fromFirestore,
        toFirestore: (model, _) => model.toFirestore(),
      );
  @override
  Future<void> addUser(Model user) async {
    await collection.add(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<Model>> getUser() {
    return collection.snapshots();
  }

  @override
  Future<void> updateUser(Model user, String id) async {
    return await collection.doc(id).update(
          user.toFirestore(),
        );
  }
}

@riverpod
UserFirestoreDataSource userFirestoreDataSource(
    UserFirestoreDataSourceRef ref) {
  return UserFirestoreDataSourceImpl();
}
