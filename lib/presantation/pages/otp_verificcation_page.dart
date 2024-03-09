import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_user_app/presantation/provider/auth_provider.dart';
import 'package:flutter_task_user_app/presantation/widgets/text_field_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtpVerificationPage extends HookConsumerWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              border: Border.all(
                width: 1,
                color: Colors.amber,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFieldWidget(
                  controller: controller,
                  labelText: "Enter OTP",
                  iconData: const Icon(
                    Icons.numbers,
                    color: Colors.amber,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize: const Size(
                              0,
                              50,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                            ),
                          ),
                          onPressed: () {
                            ref
                                .read(authenticationProvider.notifier)
                                .verifyOtp(context, controller.text);
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
