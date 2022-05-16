// import 'package:boilerplate/main.dart';
// import 'package:flutter/material.dart';

// import '../interface/views/error_page.dart';
// import '../interface/views/home_tab/home.dart';
// import '../resources/app_strings.dart';
// import 'routes.dart';

// class CustomArgs {
//   final int? args;

//   CustomArgs({this.args});
// }

// /// Route manager
// class RouterManager {
//   static Route<dynamic> generateRout(RouteSettings settings) {
//     /// Page that the router must go
//     final name = settings.name;

//     /// Arguments the page might have
//     final args = settings.arguments;

//     /// Return page route if it exists and arguments are right
//     return MaterialPageRoute<dynamic>(
//         settings: settings,
//         builder: (_) {
//           switch (name) {
//             case Routes.home:
//               return Home();
//             case Routes.profile:
//               return args is CustomArgs
//                   // ? SomeView(args: CustomArgs(args: args))
//                   ? Container()
//                   : const ErrorPage();
//           }

//           /// If page doesn't exists or argument were incorrect, return error route
//           return const ErrorPage();
//         });
//   }
// }
