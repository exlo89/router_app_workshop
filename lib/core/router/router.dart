import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailsRoute.page),
        AutoRoute(page: FavoritesRoute.page),
        AutoRoute(page: AboutRoute.page),
      ];
}
