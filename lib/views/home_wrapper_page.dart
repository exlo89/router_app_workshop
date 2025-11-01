import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Home Wrapper page demonstrating nested routes within the Home tab
/// This creates a navigation stack within the Home tab
///
/// Structure:
/// Dashboard
///   └── HomeWrapper
///       ├── HomePage (initial)
///       └── DetailsPage (cafe object)
@RoutePage()
class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
