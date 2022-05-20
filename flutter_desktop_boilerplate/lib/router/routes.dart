import 'package:flutter/material.dart';

class Routes {
  /// Application's first screen
  static const String root = "/";

  static const String home = "/home";
  static const String homeFollowUp = "/homeFollowUp";

  /// Sign Up view localized string
  static const String profile = "/profile";
  static const String connect = "/connect";
  static const String login = "/login";
  static const String signUp = "/signUp";

  /// Error Page
  static const String error = "/error";

  // Left Menu Navigation Items
  static List<NavigationRoutes> menuNavigationRoutes() => [
        NavigationRoutes(
            name: "Home", route: home, iconData: Icons.home_rounded),
        NavigationRoutes(
            name: "Profile", route: profile, iconData: Icons.person),
      ];
}

class NavigationRoutes {
  String name, route;
  IconData iconData;
  NavigationRoutes(
      {required this.name, required this.route, required this.iconData});
}
