import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/views/home/home.dart';
import 'package:flutter_desktop_boilerplate/interface/views/home/home_follow_up.dart';
import 'package:flutter_desktop_boilerplate/interface/views/profile/profile.dart';
import 'package:flutter_desktop_boilerplate/model/entity/content.dart';
import 'package:flutter_desktop_boilerplate/router/routes.dart';

import '../interface/views/error_page.dart';
import '../main.dart';

/// Route manager
class RouterManager {
  static Route<dynamic> generateRout(RouteSettings settings) {
    /// Page that the router must go
    final name = settings.name;

    /// Arguments the page might have
    final args = settings.arguments;

    /// Return page route if it exists and arguments are right
    return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (_) {
          switch (name) {
            case Routes.root:
              return const App();
            case Routes.home:
              return const Home();
            case Routes.homeFollowUp:
              if (args is Content) {
                return HomeFollowUp(content: args);
              }
              break;
            // case Routes.homeFollowUp:
            //   if (args is Content) {
            //     return HomeFollowUp(content: args);
            //   }
            //   break;
            case Routes.profile:
              return const Profile();
            //   if (args is SignUpController) {
            //     return Profile(signUpController: args);
            //   }
            //   break;
            // case Routes.connect:
            //   return const Connect();
            // case Routes.login:
            //   return const Login();
            // case Routes.signUp:
            //   return const SignUp();
          }

          /// If page doesn't exists or argument were incorrect, return error route
          return const ErrorPage();
        });
  }
}
