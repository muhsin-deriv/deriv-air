import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get black {
    return ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white54,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        cardColor: Colors.white10,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        ));
  }
}
