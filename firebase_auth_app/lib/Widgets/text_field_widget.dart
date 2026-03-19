import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  String hintText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(strokeAlign: 2),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: .circular(10)),
      ),
      controller: controller,
    );
  }
}
