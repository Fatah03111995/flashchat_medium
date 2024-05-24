import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class UtilComponent {
  static void showSnackBarErr(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        value,
        style: TextStyles.errSnackbar,
      ),
      backgroundColor: Colors.red[200],
      duration: const Duration(seconds: 3),
    ));
  }

  static void showSnackBarSuccess(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        value,
        style: TextStyles.successSnackbar,
      ),
      backgroundColor: Colors.green[300],
      duration: const Duration(seconds: 3),
    ));
  }
}
