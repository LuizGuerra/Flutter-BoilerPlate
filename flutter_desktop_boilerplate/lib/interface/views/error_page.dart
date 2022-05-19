import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/app_strings.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(""),
      ),
      child: Center(
        child: Text(
          AppStrings.error.router,
          style: const TextStyle(color: AppColors.white),
        ),
      )
    );
  }
}