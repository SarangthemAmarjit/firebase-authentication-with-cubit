// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/dashboard.dart' as _i2;
import '../pages/login2.dart' as _i1;
import '../pages/signup.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginnewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginnewPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    SignupnewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignupnewPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/loginpage',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          LoginnewRoute.name,
          path: '/loginpage',
        ),
        _i4.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
        ),
        _i4.RouteConfig(
          SignupnewRoute.name,
          path: '/signupnew-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginnewPage]
class LoginnewRoute extends _i4.PageRouteInfo<void> {
  const LoginnewRoute()
      : super(
          LoginnewRoute.name,
          path: '/loginpage',
        );

  static const String name = 'LoginnewRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i4.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.SignupnewPage]
class SignupnewRoute extends _i4.PageRouteInfo<void> {
  const SignupnewRoute()
      : super(
          SignupnewRoute.name,
          path: '/signupnew-page',
        );

  static const String name = 'SignupnewRoute';
}
