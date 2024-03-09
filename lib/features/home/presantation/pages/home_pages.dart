import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_user_app/features/authentication/presantation/provider/auth_provider.dart';
import 'package:flutter_task_user_app/features/home/presantation/widgets/bottom_widget.dart';
import 'package:flutter_task_user_app/features/home/presantation/widgets/list_view_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Test App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ref.read(authenticationProvider.notifier).signOut(context);
              },
              icon: Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Details',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              ListViewWidget(),
            ],
          ),
        ),
        bottomNavigationBar: BottomWidget(),
      ),
    );
  }
}
