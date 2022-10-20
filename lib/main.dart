import 'package:flutter/material.dart';
import 'package:price_tracker/theme.dart';
import 'features/tab_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deriv Air',
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.black,
      home: TabPage(),
    );
  }
}
