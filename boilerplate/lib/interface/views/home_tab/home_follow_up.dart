import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/entity/content.dart';

class HomeFollowUp extends StatelessWidget {
  final Content content;
  const HomeFollowUp({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.background,
        previousPageTitle: AppStrings.appBar.home,
        middle: const Text(
          "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            content.image,
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(height: 16),
          Text(content.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(content.description, style: const TextStyle(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: content.numbers.map((e) => Text(e.toString())).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
