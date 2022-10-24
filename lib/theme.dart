import 'package:flutter/material.dart';

final _darkGrey = Color.fromRGBO(26, 26, 26, 1);

class CustomTheme {
  static ThemeData get black {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.red,
      primaryColorDark: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) => Colors.red,
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.red.withOpacity(0.2),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.white54,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      cardColor: _darkGrey,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _darkGrey,
      ),
      dialogTheme: DialogTheme(backgroundColor: _darkGrey),
    );
  }
}
