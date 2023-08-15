import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/model/network/user_model.dart';
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
    final sizeType = ButtonSizeExtension.fromAvailableSpace(
        MediaQuery.of(context).size.width);
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: (sizeType == ButtonSize.small) ? 20 : 40),
          LeftNavigation(currentRoute: currentRoute),
          const SizedBox(width: 40),
          Expanded(child: child ?? Container()),
          SizedBox(width: (sizeType == ButtonSize.small) ? 20 : 40)
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
    return SizedBox(
      width: buttonSize.toWidth(),
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
              .map((navigationRoute) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: NavigationButton(
                    navigationRoute.name,
                    navigationRoute.iconData,
                    action: () {
                      if (navigationRoute.route == Routes.profile &&
                          !UserModel().isConnected()) {
                        // if is going to profile while logged off
                        Navigator.of(context).pushNamed(navigationRoute.route);
                        return;
                      }
                      // If is not trying to go to the same page that is currently loaded
                      if (currentRoute != navigationRoute.route) {
                        Navigator.of(context)
                            .pushReplacementNamed(navigationRoute.route);
                      }
                    },
                    isSelected: currentRoute == navigationRoute.route,
                  )))
              .toList(),
        ],
      ),
    );
  }
}
