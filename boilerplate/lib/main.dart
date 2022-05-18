import 'package:boilerplate/interface/views/error_page.dart';
import 'package:boilerplate/interface/views/profile/profile.dart';
import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:boilerplate/router/router_manager.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'interface/views/home_tab/home.dart';

void main() {
  runApp(const CupertinoApp(
    debugShowCheckedModeBanner: false,
    theme: CupertinoThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.background,
        barBackgroundColor: AppColors.background,
        primaryColor: AppColors.mainColor,
        textTheme: CupertinoTextThemeData(
            primaryColor: AppColors.white,
            textStyle: TextStyle(color: AppColors.white))),
    onGenerateRoute: RouterManager.generateRout,
    initialRoute: Routes.root,
    // home: App(),
  ));
}

class LoadingApp extends StatelessWidget {
  const LoadingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> _bottomBarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.home),
        label: AppStrings.bottomBar.home),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.person),
        label: AppStrings.bottomBar.profile)
  ];

  final _tabBarController = CupertinoTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabBarController,
      tabBar: CupertinoTabBar(
        items: _bottomBarItems,
      ),
      tabBuilder: _tabBuilder,
    );
  }

  Widget _tabBuilder(BuildContext context, int index) {
    return CupertinoTabView(
        builder: (_) {
          switch (index) {
            case 0:
              return const Home();
            case 1:
              return const Profile();
          }
          return const ErrorPage();
        },
        onGenerateRoute: RouterManager.generateRout);
  }
}
