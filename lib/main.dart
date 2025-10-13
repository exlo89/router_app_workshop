import 'package:flutter/material.dart';
import 'package:router_app/core/router/router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[400],
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
      title: 'My Favourite Cafe App',
    );
  }
}
