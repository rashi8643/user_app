import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Icon iconData;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.iconData,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black26),
          prefixIcon: iconData,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}
