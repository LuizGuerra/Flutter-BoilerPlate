import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

/// Configuration class for button configurations
class WidgetButtonConfigurations {
  final Color backgroundColor;
  final Color borderColor;
  final double height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  ///Initializer
  const WidgetButtonConfigurations(
      {this.backgroundColor = AppColors.mainColor,
      this.height = 54,
      this.borderColor = AppColors.clear,
      this.padding = const EdgeInsets.symmetric(horizontal: 20),
      this.borderRadius = const BorderRadius.all(Radius.circular(20))});

  static WidgetButtonConfigurations main() => const WidgetButtonConfigurations();

  static WidgetButtonConfigurations secondary() => const WidgetButtonConfigurations(
      backgroundColor: AppColors.background, borderColor: AppColors.mainColor);

  static WidgetButtonConfigurations plain() =>
      const WidgetButtonConfigurations(backgroundColor: AppColors.clear, padding: EdgeInsets.zero);

  static WidgetButtonConfigurations navigation() =>
      const WidgetButtonConfigurations(backgroundColor: AppColors.clear);

  static WidgetButtonConfigurations grid() => const WidgetButtonConfigurations(
      backgroundColor: AppColors.clear,
      padding: EdgeInsets.symmetric(horizontal: 0),
      borderRadius: BorderRadius.zero);
}

/// Reusable button for the application
class WidgetButton extends StatefulWidget {
  /// Button text
  final Widget child;

  /// Button visual style
  final WidgetButtonConfigurations _configuration;

  /// Button action
  final VoidCallback _onPressed;

  /// ReusableButton constructor
  const WidgetButton(
      {super.key,
      required this.child,
      WidgetButtonConfigurations? configuration,
      required VoidCallback onPressed})
      : _onPressed = onPressed,
        _configuration = configuration ?? const WidgetButtonConfigurations();

  @override
  State<WidgetButton> createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._configuration.height,
      child: TextButton(
          style: TextButton.styleFrom(
            padding: widget._configuration.padding,
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
    if (widget._configuration.borderRadius == BorderRadius.zero) {
      return null;
    }
    return RoundedRectangleBorder(
        borderRadius: widget._configuration.borderRadius);
  }

  BorderSide? side() {
    if (widget._configuration.borderRadius == BorderRadius.zero) {
      return null;
    }
    return BorderSide(color: widget._configuration.borderColor, width: 2);
  }

  BorderRadius borderRadius() => const BorderRadius.all(Radius.circular(20));

  BoxDecoration border() {
    return BoxDecoration(
        border: Border.all(color: widget._configuration.borderColor, width: 2),
        borderRadius: borderRadius());
  }
}
