
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_playgound/scenes/homePage/home_page.dart';
import 'package:flutter_playgound/scenes/networkTest/network_tester.dart';
import 'package:flutter_playgound/scenes/urlInTextFinder/url_finder.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: <GoRoute>[
      GoRoute(
        path: HomePage.path,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: NetworkTester.path,
        builder: (BuildContext context, GoRouterState state) {
          return const NetworkTester();
        },
      ),
      GoRoute(
        path: URLFinder.path,
        builder: (BuildContext context, GoRouterState state) {
          return const URLFinder();
        },
      ),
    ],
  );

  static closeContext(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  static navigateToLandingScene(BuildContext context) {
    Navigator.of(context).popUntil((router) => router.settings.name == HomePage.path);
  }

  static showNetworkTesterScene(BuildContext context) {
    GoRouter.of(context).push(NetworkTester.path);
  }

  static showUrlFinderScene(BuildContext context) {
    GoRouter.of(context).push(URLFinder.path);
  }
}