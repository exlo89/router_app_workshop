import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // unprotected
        AutoRoute(page: LoginRoute.page, initial: true),

        // nested routes
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: FavoritesRoute.page),

        // protected
        AutoRoute(page: DetailsRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
