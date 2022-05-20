import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/resources/app_colors.dart';
import 'package:flutter_desktop_boilerplate/router/router_manager.dart';
import 'package:flutter_desktop_boilerplate/router/routes.dart';

import 'interface/views/home/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      applyElevationOverlayColor: false,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      brightness: Brightness.dark,
      primaryTextTheme: Typography.whiteRedwoodCity,
      textTheme: Typography.whiteRedwoodCity,
      scaffoldBackgroundColor: AppColors.background,
    ),
    onGenerateRoute: RouterManager.generateRout,
    initialRoute: Routes.root,
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}