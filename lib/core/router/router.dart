import 'package:auto_route/auto_route.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/views/details_page.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}