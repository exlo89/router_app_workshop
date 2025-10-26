import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/services/auth_service.dart';

/// Auth guard that protects routes requiring authentication
class AuthGuard extends AutoRouteGuard {
  final AuthService _authService = AuthService();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authService.isAuthenticated) {
      resolver.next();
    } else {
      // User is not authenticated, redirect to login
      resolver.redirectUntil(const LoginRoute());
    }
  }
}
