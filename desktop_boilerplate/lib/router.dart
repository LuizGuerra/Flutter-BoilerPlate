import 'package:desktop_boilerplate/view/navigation/root_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/error_page.dart';
import 'features/home/home.dart';
import 'features/profile/profile.dart';

// const _pageKey = ValueKey('_pageKey');
// const _scaffoldKey = ValueKey('_scaffoldKey');

/// Route manager
class RouterManager {
  static Route<dynamic> generateRout(RouteSettings settings) {
    /// Page that the router must go
    final name = settings.name;

    /// Arguments the page might have
    final args = settings.arguments;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
          settings: settings, builder: (_) => route(name, args));
    }
    return MaterialPageRoute<dynamic>(
        settings: settings, builder: (_) => route(name, args));
  }

  /// Return page route if it exists and arguments are right
  static Widget route(String? name, Object? args) {
    switch (name) {
      case Routes.root:
        return const RootLayout(currentIndex: 0, child: HomePage());
      case Routes.profile:
        return const RootLayout(currentIndex: 1, child: Profile());
    }

    /// If page doesn't exists or argument were incorrect, return error route
    return const ErrorPage();
  }
}

// MARK: Routes strings
class Routes {
  /// Application's first screen
  static const String root = "/";

  // Regular screens
  static const String home = "/home";
  static const String homeFollowUp = "/homeFollowUp";

  static const String profile = "/profile";
  static const String connect = "/connect";
  static const String login = "/login";
  static const String signUp = "/signUp";

  /// Error Page
  static const String error = "/error";

  // TabBar/LeftNavigation items
  static List<IconNavigationDestination> destinations =
      <IconNavigationDestination>[
    const IconNavigationDestination(
      label: 'Home',
      icon: Icon(Icons.home),
      route: root,
    ),
    const IconNavigationDestination(
      label: 'Profile',
      icon: Icon(Icons.person),
      route: profile,
    ),
  ];
}

class IconNavigationDestination {
  const IconNavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}
