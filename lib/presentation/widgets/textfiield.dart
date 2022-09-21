import 'package:flutter/material.dart';
import 'package:login_page/common/textsyle.dart';

TextField reuseableTextFeild(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    style: formFieldStyle,
    decoration: InputDecoration(
      prefix: Icon(
        icon,
        color: const Color.fromARGB(255, 9, 9, 9),
      ),
      labelText: text,
      labelStyle: formFieldStyle,
      filled: true,
      fillColor: Colors.white.withOpacity(0.5),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
