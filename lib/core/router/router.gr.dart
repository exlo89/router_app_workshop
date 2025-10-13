// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:router_app/data/model/cafe.dart' as _i5;
import 'package:router_app/views/details_page.dart' as _i1;
import 'package:router_app/views/home_page.dart' as _i2;

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i3.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i4.Key? key,
    required _i5.Cafe cafe,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(key: key, cafe: cafe),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsPage(key: args.key, cafe: args.cafe);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.cafe});

  final _i4.Key? key;

  final _i5.Cafe cafe;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, cafe: $cafe}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailsRouteArgs) return false;
    return key == other.key && cafe == other.cafe;
  }

  @override
  int get hashCode => key.hashCode ^ cafe.hashCode;
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}
