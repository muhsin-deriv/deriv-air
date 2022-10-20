import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get black {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
    );
  }
}
