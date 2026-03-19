import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.widget, this.onTap});
  Widget widget;
  var onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: .all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: .circular(10),
        ),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
