import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/auth/bloc/auth_bloc.dart';
import 'package:price_tracker/features/tab_page.dart';
import 'package:price_tracker/theme.dart';
import 'features/auth/presentation/auth_page.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static void replaceToHome() {
    _navigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/', (route) => route.settings.name == '/');
  }

  static void popCurrentPage() {
    _navigatorKey.currentState?.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Deriv Air',
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.black,
      initialRoute: 'login',
      routes: {
        'login': (context) => BlocProvider(
              child: AuthPage(),
              create: (_) => AuthBloc(),
            ),
        '/': (context) => TabPage(),
      },
    );
  }
}
