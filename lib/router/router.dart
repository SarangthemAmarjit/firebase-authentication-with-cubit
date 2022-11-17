import 'package:auto_route/auto_route.dart';
import 'package:firebaselogin/pages/dashboard.dart';
import 'package:firebaselogin/pages/login2.dart';
import 'package:firebaselogin/pages/signup.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginnewPage,
      initial: true,
      path: '/loginpage',
    ),
    AutoRoute(
      page: DashboardPage,
      path: '/dashboard',
    ),
    AutoRoute(page: SignupnewPage),
  ],
)
class $AppRouter {}
