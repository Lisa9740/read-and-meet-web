import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationMsg {
  static void showSnackBar(
      String message,
      bool isSuccess,
      BuildContext context,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(message),
        backgroundColor:
        isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}