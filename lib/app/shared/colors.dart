import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF2A2A49);
  static const borderAccent = Color(0xFF5454B0);
  static const colorAccent = Color(0xFF7777F0);

  static Color selected =
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    return states.contains(MaterialState.selected)
        ? colorAccent
        : Colors.transparent;
  });
}
