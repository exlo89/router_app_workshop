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
            // Home Wrapper - Navigation stack within Home tab
            AutoRoute(
              page: HomeWrapperRoute.page,
              initial: true,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: DetailsRoute.page),
              ],
            ),

            // Search Wrapper - Navigation stack within Search tab
            AutoRoute(
              page: SearchWrapperRoute.page,
              children: [
                AutoRoute(page: SearchRoute.page, initial: true),
                AutoRoute(page: DetailsRoute.page),
              ],
            ),

            // Favorites Wrapper - Navigation stack within Favorites tab
            AutoRoute(
              page: FavoritesWrapperRoute.page,
              children: [
                AutoRoute(page: FavoritesRoute.page, initial: true),
                AutoRoute(page: DetailsRoute.page),
              ],
            ),

            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: AboutRoute.page),
          ],
        ),

        // Deep linking route for cafe details (outside tab navigation)
        // URL: /cafe/:id (e.g., /cafe/1)
        AutoRoute(
          page: DetailsRoute.page,
          path: '/cafe/:id',
          guards: [_authGuard],
        ),
      ];
}
