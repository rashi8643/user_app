import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/presantation/provider/user_provider.dart';

class BottomsheetWidget extends ConsumerWidget {
  final UserEntity? entity;

  const BottomsheetWidget({
    super.key,
    this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void cancelAction() {
      Navigator.pop(context);
    }

    Future<String?> createOrUpdateTodo() async {
      Navigator.pop(context);
      if (entity != null) {
        return ref
            .read(userStateProvider.notifier)
            .updateUser(id: entity!.id, isChecked: entity!.isChecked);
      } else {
        return await ref.read(userStateProvider.notifier).addUser();
      }
    }

    if (entity != null) {
      ref.watch(userStateProvider.notifier).titleController.text =
          entity!.title;
    }

    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller:
                    ref.watch(userStateProvider.notifier).titleController,
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF400d6e),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24))),
                    onPressed: cancelAction,
                    child: Text('Cancel',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: Color(0xFF400d6e)),
                    onPressed: () => createOrUpdateTodo().then(
                      (error) => 'Error',
                    ),
                    child: Text(
                      entity != null ? 'Update' : 'Add',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
