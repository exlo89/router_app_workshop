import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/core/router/router.dart';
import 'package:router_app/cubits/auth/auth_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => locator<AuthCubit>(),
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown.shade400,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            displaySmall: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
            headlineMedium: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            labelMedium: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
        ),
        routerConfig: appRouter.config(),
        title: 'My Favourite Cafe App',
      ),
    );
  }
}
