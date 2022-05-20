import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/router/routes.dart';

import 'navigation_button.dart';

class LeftNavigationScaffold extends StatelessWidget {
  final String currentRoute;
  final Widget? child;
  const LeftNavigationScaffold(
      {this.child, required this.currentRoute, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LeftNavigation(currentRoute: currentRoute),
          child ?? Container()
        ],
      ),
    );
  }
}

class LeftNavigation extends StatelessWidget {
  final String currentRoute;
  const LeftNavigation({required this.currentRoute, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonSize buttonSize = ButtonSizeExtension.fromAvailableSpace(
        MediaQuery.of(context).size.width);
    return Container(
      width: buttonSize.toWidth(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Icon
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.apartment, size: 36),
          ),
          // Navigation Items
          const SizedBox(height: 8),
          ...Routes.menuNavigationRoutes()
              .map((navigationRoutes) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: NavigationButton(
                    navigationRoutes.name,
                    navigationRoutes.iconData,
                    action: () {
                      print("$currentRoute : ${navigationRoutes.route}");
                      // If is not trying to go to the same page that is currently loaded
                      if (currentRoute != navigationRoutes.route) {
                        Navigator.of(context)
                            .pushReplacementNamed(navigationRoutes.route);
                      }
                    },
                    isSelected: currentRoute == navigationRoutes.route,
                  )))
              .toList(),
        ],
      ),
    );
  }

  ButtonSize navigationSizeType(double availableWidth) {
    return availableWidth >= 200 ? ButtonSize.medium : ButtonSize.small;
  }
}
