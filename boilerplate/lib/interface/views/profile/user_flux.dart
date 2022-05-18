import 'package:boilerplate/interface/components/reusable_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../components/glass_view.dart';
import '../../components/small_reusable_button.dart';

class UserFluxPageScaffold extends StatelessWidget {
  final String title;
  final bool withBackButton;
  final Widget child;
  const UserFluxPageScaffold(this.title,
      {this.withBackButton = false, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        child: Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        background(height),
        content(context),
      ],
    ));
  }

  Widget content(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          header(context),
          Flexible(
            child: GlassComponent(
                insets: const EdgeInsets.all(20),
                radius: const BorderRadius.vertical(top: Radius.circular(40)),
                color: AppColors.background,
                child: child),
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    final titleWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 36,
        ),
      ),
    );

    if (withBackButton) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SmallReusableButton(
              configuration: SmallButtonConfigurations.plain(),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(CupertinoIcons.chevron_back),
                  Text("Back")
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          titleWidget,
          const SizedBox(height: 24),
        ],
      );
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 48, 20, 36), child: titleWidget);
  }

  Widget background(double height) {
    return SizedBox(
      height: height,
      child: Image.asset(
        AppStrings.images.background,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
