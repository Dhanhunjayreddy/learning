
import 'package:flutter/material.dart';

snack(BuildContext context,String text, {Color? color}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,
      ),
      backgroundColor: color ??Colors.green,
    ),
  );
}