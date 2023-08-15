import 'package:desktop_boilerplate/features/profile/profile.dart';
import 'package:desktop_boilerplate/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/error_page.dart';
import '../../features/home/home.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
  });

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        // Tablet Layout
        if (dimens.maxWidth >= 600) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  extended: dimens.maxWidth >= 800,
                  minExtendedWidth: 180,
                  destinations: destinations
                      .map((e) => NavigationRailDestination(
                            icon: e.icon,
                            label: Text(e.label),
                          ))
                      .toList(),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: child),
              ],
            ),
          );
        }
        // iOS
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          return CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: destinations
                    .map((e) =>
                        BottomNavigationBarItem(icon: e.icon, label: e.label))
                    .toList(),
              ),
              tabBuilder: (context, index) {
                return CupertinoTabView(
                  onGenerateRoute: RouterManager.generateRout,
                  builder: (_) {
                    switch (index) {
                      case 0:
                        return const HomePage();
                      case 1:
                        return const Profile();
                    }
                    return const ErrorPage();
                  },
                );
              });
        }
        // Android
        if (defaultTargetPlatform == TargetPlatform.android) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              items: destinations
                  .map((e) =>
                      BottomNavigationBarItem(icon: e.icon, label: e.label))
                  .toList(),
              currentIndex: selectedIndex,
              onTap: onDestinationSelected,
            ),
          );
        }
        // Mobile Layout
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: destinations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        );
      },
    );
  }
}
