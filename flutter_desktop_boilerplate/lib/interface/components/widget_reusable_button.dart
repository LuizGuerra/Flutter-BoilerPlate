import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

/// Configuration class for button configurations
class WidgetButtonConfigurations {
  final Color backgroundColor;
  final Color borderColor;
  final double height;

  ///Initializer
  WidgetButtonConfigurations(
      {this.backgroundColor = AppColors.mainColor,
      this.height = 54,
      this.borderColor = AppColors.clear});

  static WidgetButtonConfigurations main() => WidgetButtonConfigurations();

  static WidgetButtonConfigurations secondary() => WidgetButtonConfigurations(
      backgroundColor: AppColors.background, borderColor: AppColors.mainColor);

  static WidgetButtonConfigurations plainText() =>
      WidgetButtonConfigurations(backgroundColor: AppColors.clear);

  static WidgetButtonConfigurations navigation() =>
      WidgetButtonConfigurations(backgroundColor: AppColors.background2);
}

/// Reusable button for the application
class WidgetReusableButton extends StatefulWidget {
  /// Button text
  final Widget child;

  /// Button visual style
  final WidgetButtonConfigurations _configuration;

  /// Button action
  final VoidCallback _onPressed;

  /// ReusableButton constructor
  WidgetReusableButton(
      {super.key,
      required this.child,
      WidgetButtonConfigurations? configuration,
      required VoidCallback onPressed})
      : _onPressed = onPressed,
        _configuration = configuration ?? WidgetButtonConfigurations();

  @override
  State<WidgetReusableButton> createState() => _WidgetReusableButtonState();
}

class _WidgetReusableButtonState extends State<WidgetReusableButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._configuration.height,
      child: TextButton(
          style: TextButton.styleFrom(
            padding: padding(),
            backgroundColor: widget._configuration.backgroundColor,
            alignment: Alignment.centerLeft,
            shape: shape(),
            side: side(),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return AppColors.lightGray.withOpacity(0.1);
                }
                return widget._configuration.backgroundColor;
              },
            ),
          ),
          onPressed: widget._onPressed,
          child: widget.child),
    );
  }

  RoundedRectangleBorder? shape() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }

  BorderSide? side() {
    return BorderSide(color: widget._configuration.borderColor, width: 2);
  }

  BorderRadius borderRadius() => const BorderRadius.all(Radius.circular(20));

  BoxDecoration border() {
    return BoxDecoration(
        border: Border.all(color: widget._configuration.borderColor, width: 2),
        borderRadius: borderRadius());
  }

  EdgeInsetsGeometry padding() {
    return const EdgeInsets.symmetric(horizontal: 20.0);
  }
}
