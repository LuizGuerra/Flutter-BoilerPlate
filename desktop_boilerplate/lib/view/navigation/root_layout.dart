import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../router.dart';
import 'adaptive_navigation.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      void onSelected(int index) {
        if(currentIndex == index) {
          return;
        }
        final destination = Routes.destinations[index];
        Navigator.of(context).pushReplacementNamed(destination.route);
      }

      return AdaptiveNavigation(
        key: _navigationRailKey,
        destinations: Routes.destinations
            .map((e) => NavigationDestination(
                  icon: e.icon,
                  label: e.label,
                ))
            .toList(),
        selectedIndex: currentIndex,
        onDestinationSelected: onSelected,
        child: Column(
          children: [
            Expanded(
              child: _Switcher(
                child: child,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// ignore: unused_element
class _Switcher extends StatelessWidget {
  final bool isDesktop = defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
  final Widget child;

  _Switcher({required this.child});

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? child
        : AnimatedSwitcher(
            key: key,
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: child,
          );
  }
}
