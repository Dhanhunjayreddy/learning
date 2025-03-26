import 'package:flutter/material.dart';

inputTextFieldDecoration({String? hintText, Widget? prefix}) {
  return InputDecoration(
counterText: "",
      hintText: hintText,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      suffixIcon: prefix);
}
