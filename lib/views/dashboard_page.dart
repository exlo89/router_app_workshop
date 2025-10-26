import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_app/core/router/router.gr.dart';
import 'package:router_app/services/auth_service.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return AutoTabsScaffold(
      routes: [
        HomeRoute(),
        const FavoritesRoute(),
        const AboutRoute(),
      ],
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: const Text('Coffee Browser'),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Hello, ${authService.username}!',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'Profile',
              onPressed: () {
                context.router.push(ProfileRoute(isAdmin: true));
              },
            ),
            // Logout button
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await authService.logout();
                if (context.mounted) {
                  context.router.replace(const LoginRoute());
                }
              },
            ),
          ],
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline),
              selectedIcon: Icon(Icons.info),
              label: 'About',
            ),
          ],
        );
      },
    );
  }
}
