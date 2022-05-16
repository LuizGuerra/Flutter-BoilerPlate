import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appBar.titleExample),
        ),
        body: Center(
          // child: Text(AppStrings.helloWorld, style: const TextStyle(color: AppColors.white)),
          child: Column(
            children: [
              Text(AppStrings.helloWorld, style: const TextStyle(color: AppColors.white)),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(Routes.home_follow_up.name);
                  context.goNamed(Routes.home_follow_up.name);
                },
                child: const Text("Next screen"),
              )
            ],
          ),
        ));
  }
}
