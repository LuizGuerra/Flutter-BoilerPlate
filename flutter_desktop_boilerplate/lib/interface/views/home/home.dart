import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/components/left_navigation/left_navigation.dart';
import 'package:flutter_desktop_boilerplate/router/routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LeftNavigationScaffold(
      currentRoute: Routes.home,
      child: Container()
    );
  }
}
