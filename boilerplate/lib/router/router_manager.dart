import 'package:boilerplate/interface/views/home_tab/home_follow_up.dart';
import 'package:boilerplate/interface/views/profile/profile.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';

import '../interface/views/error_page.dart';
import '../interface/views/home_tab/home.dart';
import '../main.dart';

class CustomArgs {
  final int? args;
  CustomArgs({this.args});
}

/// Route manager
class RouterManager {
  static Route<dynamic> generateRout(RouteSettings settings) {
    /// Page that the router must go
    final name = settings.name;

    /// Arguments the page might have
    final args = settings.arguments;

    /// Return page route if it exists and arguments are right
    return CupertinoPageRoute<dynamic>(
        settings: settings,
        builder: (_) {
          switch (name) {
            case Routes.root:
              return App();
            case Routes.home:
              return const Home();
            case Routes.homeFollowUp:
              return const HomeFollowUp();
            case Routes.profile:
              return const Profile();

              // return args is CustomArgs
              //     // ? SomeView(args: CustomArgs(args: args))
              //     ? const Profile()
              //     : const ErrorPage();
          }

          /// If page doesn't exists or argument were incorrect, return error route
          return const ErrorPage();
        });
  }
}
