import 'dart:ffi';

import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'interface/views/error_page.dart';
import 'interface/views/home_tab/home.dart';
import 'interface/views/home_tab/home_follow_up.dart';

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(
//         scaffoldBackgroundColor: AppColors.background,
//         appBarTheme: AppBarTheme(
//           backgroundColor: AppColors.background,
//           elevation: 10,
//         )),
//     onGenerateRoute: RouterManager.generateRout,
//     initialRoute: Routes.home,
//   ));
// }

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Routing information
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,

      // Application Theme
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            elevation: 0,
          ),
        ),

      // Other stuff
      // title: AppStrings.appBar.titleExample,
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          // name: "",
          path: "/",
          pageBuilder: (context, state) =>
              MaterialPage(key: state.pageKey, child: const Home()),
        ),
        GoRoute(
            name: Routes.home_follow_up.name,
            path: Routes.home_follow_up.localized(),
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const HomeFollowUp())),
        GoRoute(
          name: Routes.profile.name,
          path: Routes.profile.localized(),
          builder: (context, state) => const Scaffold(),
        ),
      ],
      errorPageBuilder: (context, state) =>
          MaterialPage(key: state.pageKey, child: const ErrorPage()));
}











// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       bottomNavigationBar: AppBottomBar(),
//       body: Home(),
//     );
//   }
// }
// class AppBottomBar extends StatefulWidget {
//   const AppBottomBar({Key? key}) : super(key: key);

//   @override
//   State<AppBottomBar> createState() => _AppBottomBarState();
// }

// class _AppBottomBarState extends State<AppBottomBar> {
  
//   int _index = 0;

//   void _update(int index) {
//     // switch(index){
//     //   case 0:
//     //     Navigator.pushNamed(context, "/first");
//     //     break;
//     //   case 1:
//     //     Navigator.pushNamed(context, "/second");
//     //     break;
//     // }
//     setState(() {
//       _index = index;
//     });
//   }

//   List<BottomNavigationBarItem> bottomBarItems = <BottomNavigationBarItem>[
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.home),
//       label: AppStrings.bottomBar.home
//     ),
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.person),
//       label: AppStrings.bottomBar.profile
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: bottomBarItems,
//       currentIndex: _index,
//       selectedItemColor: AppColors.mainColor,
//       unselectedItemColor: AppColors.lightGray,
//       backgroundColor: AppColors.background,
//       onTap: _update,
//       );
//   }
// }
