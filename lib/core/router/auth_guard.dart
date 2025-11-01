import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/di/service_locator.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/cubits/auth/auth_cubit.dart';

/// Auth guard that protects routes requiring authentication
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authCubit = locator<AuthCubit>();

    if (authCubit.state.isAuthenticated) {
      resolver.next();
    } else {
      // User is not authenticated, redirect to login
      resolver.redirectUntil(const LoginRoute());
    }
  }
}
