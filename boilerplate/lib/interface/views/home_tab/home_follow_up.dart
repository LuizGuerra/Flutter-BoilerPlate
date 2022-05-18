import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:flutter/cupertino.dart';

class HomeFollowUp extends StatelessWidget {
  final int indexArgument;
  const HomeFollowUp({required this.indexArgument, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.background,
        previousPageTitle: AppStrings.appBar.home,
        middle: Text(
          'Home Follow Up @$indexArgument',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Follow Up at the index of @$indexArgument", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
            const SizedBox(height: 24),
            const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", style: TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(height: 16),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("1"),
                  SizedBox(width: 24),
                  Text("2"),
                  SizedBox(width: 24),
                  Text("3"),
                  SizedBox(width: 24),
                  Text("4"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
