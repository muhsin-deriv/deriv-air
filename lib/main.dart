import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:price_tracker/theme.dart';
import 'features/auth/presentation/auth_page.dart';

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
      home: BlocProvider(
        child: AuthPage(),
        create: (_) => AuthBloc(),
      ),
    );
  }
}
