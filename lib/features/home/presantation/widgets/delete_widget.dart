import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/presantation/provider/user_provider.dart';

class DeleteWidget extends ConsumerWidget {
  final UserEntity todo;
  const DeleteWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Are you sure ?'),
      content: Text('This todo will delete permenantly'),
      actions: [
        TextButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            child: Text('Cancel')),
        TextButton(
          onPressed: () {
            ref.read(userStateProvider.notifier).deleteUser(todo.id);
            Navigator.of(context).pop();
          },
          child: Text('Delete'),
        )
      ],
    );
  }
}
