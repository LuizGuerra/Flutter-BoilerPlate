import 'package:boilerplate/resources/app_colors.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/entity/content.dart';

class HomeFollowUp extends StatelessWidget {
  final Content content;
  const HomeFollowUp({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.background,
        previousPageTitle: AppStrings.appBar.home,
        middle: const Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      child: ListView(
        children: [
          Image.network(
            content.image,
            width: width,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, widget, chunk) => Container(
                width: width,
                height: 200,
                color: AppColors.background2,
                child: Icon(CupertinoIcons.exclamationmark_circle,
                    color: AppColors.red.withOpacity(0.8))),
          ),
          const SizedBox(height: 16),
          Text(content.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(content.description, style: const TextStyle(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: content.numbers.map((e) => Text(e.toString())).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
