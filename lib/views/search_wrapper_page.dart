import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Search Wrapper page demonstrating nested routes within a tab
/// This is Level 3+: Nested Route in Nested Route
///
/// Structure:
/// Dashboard (Level 1 nesting)
///   └── SearchWrapper (Level 2 nesting)
///       ├── SearchPage (initial)
///       └── DetailsPage (cafe object)
@RoutePage()
class SearchWrapperPage extends StatelessWidget {
  const SearchWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
