import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_user_app/features/home/domain/entity/user_entity.dart';
import 'package:flutter_task_user_app/features/home/presantation/provider/user_provider.dart';
import 'package:flutter_task_user_app/features/home/presantation/widgets/bottom_sheet_widget.dart';
import 'package:flutter_task_user_app/features/home/presantation/widgets/delete_widget.dart';

class ListViewWidget extends ConsumerWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(userProvider)) {
      // ignore: unnecessary_null_comparison
      AsyncData(:final value) => (ref.watch(userProvider)) == null
          ? const Center(
              child: Text(
                'No Datas',
                style: TextStyle(
                  color: Colors.black12,
                  fontSize: 30,
                ),
              ),
            )
          : SizedBox(
              height: 508,
              child: ListView.builder(
                controller:
                    ref.read(userStateProvider.notifier).scrollController,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: value.length,
                itemBuilder: (context, index) {
                  List<UserEntity> data = [
                    for (final values in value)
                      UserEntity(
                        id: values.id,
                        title: values.title,
                        isChecked: values.isChecked,
                      ),
                  ];
                  data.sort(
                    (a, b) => a.title.compareTo(b.title),
                  );

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => BottomsheetWidget(
                                    entity: data[index],
                                  ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 68,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                CircleAvatar(),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    data[index].title,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) => DeleteWidget(
                                              todo: data[index],
                                            )));
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
      AsyncError() => const Center(
          child: Text(
            'Error',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
