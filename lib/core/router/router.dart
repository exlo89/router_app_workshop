import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/router/auth_guard.dart';
import 'package:router_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final _authGuard = AuthGuard();

  @override
  List<AutoRoute> get routes => [
        // unprotected
        AutoRoute(page: LoginRoute.page, initial: true),

        // Dashboard with nested tabs - protected by auth guard
        AutoRoute(
          page: DashboardRoute.page,
          guards: [_authGuard],
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: FavoritesRoute.page),
            AutoRoute(page: AboutRoute.page),
          ],
        ),

        // protected
        AutoRoute(page: DetailsRoute.page, guards: [_authGuard]),
        AutoRoute(page: ProfileRoute.page, guards: [_authGuard]),
      ];
}
