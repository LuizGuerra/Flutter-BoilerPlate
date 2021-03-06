import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

/// Configuration class for button configurations
class ButtonConfigurations {
  final FontWeight fontWeight;
  final Color fontColor;
  final double fontSize;
  final Color backgroundColor;
  final double height;
  final bool hasBorder;

  ///Initializer
  ButtonConfigurations(
      {this.fontWeight = FontWeight.w600,
      this.fontColor = AppColors.white,
      this.fontSize = 16,
      this.backgroundColor = AppColors.mainColor,
      this.height = 54,
      this.hasBorder = false});

  static ButtonConfigurations main() => ButtonConfigurations();

  static ButtonConfigurations secondary() => ButtonConfigurations(
      fontColor: AppColors.mainColor,
      backgroundColor: AppColors.background,
      hasBorder: true);

  static ButtonConfigurations plainText() => ButtonConfigurations(
      fontWeight: FontWeight.w300,
      fontColor: AppColors.white,
      backgroundColor: AppColors.clear);

  static ButtonConfigurations navigation() => ButtonConfigurations(
      fontWeight: FontWeight.bold,
      fontColor: AppColors.white,
      backgroundColor: AppColors.background2);
}

/// Reusable button for the application
class ReusableButton extends StatefulWidget {
  /// Button text
  final String _text;

  /// Button visual style
  final ButtonConfigurations _configuration;

  /// Button action
  final VoidCallback _onPressed;

  /// ReusableButton constructor
  ReusableButton(String text,
      {super.key,
      ButtonConfigurations? configuration,
      required VoidCallback onPressed})
      : _text = text,
        _onPressed = onPressed,
        _configuration = configuration ?? ButtonConfigurations();

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._configuration.height,
      width: null,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding(),
          backgroundColor: widget._configuration.backgroundColor,
          alignment: Alignment.centerLeft,
          shape: shape(),
          side: side(),
        ),
        onPressed: widget._onPressed,
        child: buttonChild(),
      ),
    );
  }

  RoundedRectangleBorder? shape() {
    return const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }

  BorderSide? side() {
    return widget._configuration.hasBorder
        ? BorderSide(color: widget._configuration.fontColor, width: 2)
        : null;
  }

  BorderRadius borderRadius() => const BorderRadius.all(Radius.circular(20));

  BoxDecoration border() {
    if (widget._configuration.hasBorder) {
      return BoxDecoration(
          border: Border.all(color: widget._configuration.fontColor, width: 2),
          borderRadius: borderRadius());
    }
    return const BoxDecoration();
  }

  EdgeInsetsGeometry padding() {
    return const EdgeInsets.symmetric(horizontal: 20.0);
  }

  Widget buttonChild() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.home, color: widget._configuration.fontColor),
        const SizedBox(width: 16),
        Text(
          widget._text,
          style: TextStyle(
            color: widget._configuration.fontColor,
            fontSize: widget._configuration.fontSize,
            fontWeight: widget._configuration.fontWeight,
          ),
        ),
      ],
    );
  }
}
