import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

/// Configuration class for button configurations
class SmallButtonConfigurations {
  final Color backgroundColor;
  final Color borderColor;
  final double height;

  ///Initializer
  SmallButtonConfigurations(
      {this.backgroundColor = AppColors.mainColor,
      this.height = 54,
      this.borderColor = AppColors.clear});

  static SmallButtonConfigurations main() => SmallButtonConfigurations();

  static SmallButtonConfigurations secondary() => SmallButtonConfigurations(
      backgroundColor: AppColors.background, borderColor: AppColors.mainColor);

  static SmallButtonConfigurations plain() =>
      SmallButtonConfigurations(backgroundColor: AppColors.clear);
}

/// Reusable button for the application
class SmallReusableButton extends StatefulWidget {
  /// Button text
  final Widget child;

  /// Button visual style
  final SmallButtonConfigurations configuration;

  /// Button action
  final VoidCallback onPressed;

  /// ReusableButton constructor
  const SmallReusableButton(
      {super.key,
      required this.configuration,
      required this.onPressed,
      required this.child});

  @override
  State<SmallReusableButton> createState() => _SmallReusableButton();
}

class _SmallReusableButton extends State<SmallReusableButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.configuration.height,
      decoration: border(),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          color: widget.configuration.backgroundColor,
          borderRadius: borderRadius(),
          onPressed: widget.onPressed,
          child: widget.child),
    );
  }

  BorderRadius borderRadius() => const BorderRadius.all(Radius.circular(20));

  BoxDecoration border() {
    return BoxDecoration(
        border: Border.all(color: widget.configuration.borderColor, width: 2),
        borderRadius: borderRadius());
  }

  EdgeInsetsGeometry padding() {
    return const EdgeInsets.symmetric(horizontal: 20.0);
  }
}
