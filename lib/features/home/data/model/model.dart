import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class Model with _$Model {
  const Model._();

  const factory Model({
    required String title,
    required bool isChecked,
  }) = _Model;

  factory Model.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Model(
      title: data?['title'],
      isChecked: data?['ischecked'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "ischecked": isChecked,
    };
  }
}
