import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

/// Configuration class for button configurations
class ButtonConfigurations {
  final FontWeight fontWeight;
  final Color fontColor;
  final Color backgroundColor;
  final double fontSize;
  final double height;
  final bool hasBorder;
  
  ///Initializer
  ButtonConfigurations(
      {this.fontWeight = FontWeight.w600,
      this.fontColor = AppColors.white,
      this.backgroundColor = AppColors.mainColor,
      this.fontSize = 16,
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
    backgroundColor: AppColors.clear
  );
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
    return Container(
      height: widget._configuration.height,
      decoration: border(),
      child: CupertinoButton(
          padding: padding(),
          color: widget._configuration.backgroundColor,
          borderRadius: borderRadius(),
          onPressed: widget._onPressed,
          child: buttonChild()),
    );
  }

  BorderRadius borderRadius() => const BorderRadius.all(Radius.circular(20));

  BoxDecoration border() {
    if (widget._configuration.hasBorder) {
      return BoxDecoration(
          border: Border.all(color: widget._configuration.fontColor, width: 2),
          borderRadius: borderRadius()
      );
    }
    return const BoxDecoration();
  }

  EdgeInsetsGeometry padding() {
    return const EdgeInsets.symmetric(horizontal: 20.0);
  }

  Widget buttonChild() {
    return Center(
      child: Text(
        widget._text,
        style: TextStyle(
          color: widget._configuration.fontColor,
          fontSize: widget._configuration.fontSize,
          fontWeight: widget._configuration.fontWeight,
        ),
      ),
    );
  }
}
