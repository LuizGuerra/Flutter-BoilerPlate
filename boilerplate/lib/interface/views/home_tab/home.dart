import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../router/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(),
        child: SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 36),
            Text(AppStrings.helloWorld,
                style: const TextStyle(color: AppColors.white)),
            const SizedBox(height: 36),
            CupertinoButton.filled(
                child: const Text("Next Page"),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.homeFollowUp);
                }),
          ],
        ),
      ),
    ));
  }
}
