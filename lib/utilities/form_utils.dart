import 'package:flutter/cupertino.dart';

class FormUtils {
 static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@')) {
      return 'Email must contain "@"';
    }

    if (!RegExp(r'^[a-zA-Z0-9@._]+$').hasMatch(value)) {
      return 'Only letters, numbers, ".", "_", and "@" are allowed';
    }

    return null;
  }
}
