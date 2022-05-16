import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:flutter/cupertino.dart';

class HomeFollowUp extends StatelessWidget {
  const HomeFollowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.background,
        previousPageTitle: AppStrings.appBar.home,
        middle: const Text(
          'Home Follow Up',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      child: const Center(child: Text("Home Follow Up")),
    );
  }
}
