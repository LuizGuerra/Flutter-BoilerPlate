import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/components/left_navigation/left_navigation.dart';
import 'package:flutter_desktop_boilerplate/router/routes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LeftNavigationScaffold(
      currentRoute: Routes.profile,
      child: Container()
    );
  }
}