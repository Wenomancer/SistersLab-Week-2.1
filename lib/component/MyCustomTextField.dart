import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? textColor;

  const MyCustomTextField({
    super.key,
    required this.controller,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        style: TextStyle(color: textColor),
        cursorColor: Colors.red,
        obscureText: false,
      ),
    );
  }
}