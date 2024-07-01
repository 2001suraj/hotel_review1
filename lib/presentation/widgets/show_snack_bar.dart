import 'package:flutter/material.dart';

showsnackBar(
    {required BuildContext context,
    required String text,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(text),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
