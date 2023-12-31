import 'package:flutter/material.dart';

import '../styles/colors.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: secondaryColor),
      ),
      backgroundColor: primaryColor));
}
