import 'package:boilerplate/controller/sign_up_controller.dart';
import 'package:boilerplate/interface/views/home_tab/home_follow_up.dart';
import 'package:boilerplate/interface/views/profile/connect.dart';
import 'package:boilerplate/interface/views/profile/login.dart';
import 'package:boilerplate/interface/views/profile/profile.dart';
import 'package:boilerplate/interface/views/profile/sign_up.dart';
import 'package:boilerplate/model/entity/content.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';

import '../interface/views/error_page.dart';
import '../interface/views/home_tab/home.dart';
import '../main.dart';

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
              if (args is Content) {
                return HomeFollowUp(content: args);
              }
              break;
            case Routes.profile:
              if (args is SignUpController) {
                return Profile(signUpController: args);
              }
              break;
            case Routes.connect:
              return const Connect();
            case Routes.login:
              return const Login();
            case Routes.signUp:
              return const SignUp();
          }

          /// If page doesn't exists or argument were incorrect, return error route
          return const ErrorPage();
        });
  }
}
