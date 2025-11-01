import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Favorites Wrapper page demonstrating nested routes within the Favorites tab
/// This creates a navigation stack within the Favorites tab
///
/// Structure:
/// Dashboard
///   └── FavoritesWrapper
///       ├── FavoritesPage (initial)
///       └── DetailsPage (cafe object)
@RoutePage()
class FavoritesWrapperPage extends StatelessWidget {
  const FavoritesWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
