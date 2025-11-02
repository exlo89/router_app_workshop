// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:router_app/data/model/cafe.dart' as _i14;
import 'package:router_app/views/about_page.dart' as _i1;
import 'package:router_app/views/dashboard_page.dart' as _i2;
import 'package:router_app/views/details_page.dart' as _i3;
import 'package:router_app/views/favorites_page.dart' as _i4;
import 'package:router_app/views/favorites_wrapper_page.dart' as _i5;
import 'package:router_app/views/home_page.dart' as _i6;
import 'package:router_app/views/home_wrapper_page.dart' as _i7;
import 'package:router_app/views/login_page.dart' as _i8;
import 'package:router_app/views/profile_page.dart' as _i9;
import 'package:router_app/views/search_page.dart' as _i10;
import 'package:router_app/views/search_wrapper_page.dart' as _i11;

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i12.PageRouteInfo<void> {
  const AboutRoute({List<_i12.PageRouteInfo>? children})
      : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i2.DashboardPage());
    },
  );
}

/// generated route for
/// [_i3.DetailsPage]
class DetailsRoute extends _i12.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i13.Key? key,
    required _i14.Cafe cafe,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(key: key, cafe: cafe),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i12.WrappedRoute(
        child: _i3.DetailsPage(key: args.key, cafe: args.cafe),
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.cafe});

  final _i13.Key? key;

  final _i14.Cafe cafe;

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
/// [_i4.FavoritesPage]
class FavoritesRoute extends _i12.PageRouteInfo<void> {
  const FavoritesRoute({List<_i12.PageRouteInfo>? children})
      : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i4.FavoritesPage());
    },
  );
}

/// generated route for
/// [_i5.FavoritesWrapperPage]
class FavoritesWrapperRoute extends _i12.PageRouteInfo<void> {
  const FavoritesWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(FavoritesWrapperRoute.name, initialChildren: children);

  static const String name = 'FavoritesWrapperRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavoritesWrapperPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    String filter = '',
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(filter: filter, key: key),
          rawQueryParams: {'filter': filter},
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () =>
            HomeRouteArgs(filter: queryParams.getString('filter', '')),
      );
      return _i12.WrappedRoute(
        child: _i6.HomePage(filter: args.filter, key: args.key),
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.filter = '', this.key});

  final String filter;

  final _i13.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{filter: $filter, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return filter == other.filter && key == other.key;
  }

  @override
  int get hashCode => filter.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.HomeWrapperPage]
class HomeWrapperRoute extends _i12.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, initialChildren: children);

  static const String name = 'HomeWrapperRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeWrapperPage();
    },
  );
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginPage();
    },
  );
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i13.Key? key,
    bool isAdmin = false,
    required String username,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args:
              ProfileRouteArgs(key: key, isAdmin: isAdmin, username: username),
          rawQueryParams: {'isAdmin': isAdmin},
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return _i9.ProfilePage(
        key: args.key,
        isAdmin: args.isAdmin,
        username: args.username,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.isAdmin = false,
    required this.username,
  });

  final _i13.Key? key;

  final bool isAdmin;

  final String username;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, isAdmin: $isAdmin, username: $username}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return key == other.key &&
        isAdmin == other.isAdmin &&
        username == other.username;
  }

  @override
  int get hashCode => key.hashCode ^ isAdmin.hashCode ^ username.hashCode;
}

/// generated route for
/// [_i10.SearchPage]
class SearchRoute extends _i12.PageRouteInfo<void> {
  const SearchRoute({List<_i12.PageRouteInfo>? children})
      : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i10.SearchPage());
    },
  );
}

/// generated route for
/// [_i11.SearchWrapperPage]
class SearchWrapperRoute extends _i12.PageRouteInfo<void> {
  const SearchWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(SearchWrapperRoute.name, initialChildren: children);

  static const String name = 'SearchWrapperRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SearchWrapperPage();
    },
  );
}
