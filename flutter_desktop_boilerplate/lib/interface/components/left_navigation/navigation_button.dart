import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../widget_reusable_button.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final IconData iconData;

  final Function action;
  final bool isSelected;

  const NavigationButton(this.text, this.iconData,
      {required this.isSelected, required this.action, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonSize = ButtonSizeExtension.fromAvailableSpace(
        MediaQuery.of(context).size.width);
    return SizedBox(
      width: buttonSize.toWidth(),
      child: WidgetReusableButton(
        configuration: WidgetButtonConfigurations.navigation(),
        onPressed: () {
          action();
        },
        child: child(buttonSize),
      ),
    );
  }

  Widget child(ButtonSize buttonSize) {
    if (buttonSize == ButtonSize.small) {
      return Icon(
        iconData,
        color: AppColors.white,
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData, color: AppColors.white),
        const SizedBox(width: 16),
        Text(text,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal))
      ],
    );
  }
}

// Button Size enum and functions
enum ButtonSize { small, medium }

extension ButtonSizeExtension on ButtonSize {
  double toWidth() {
    switch (this) {
      case ButtonSize.small:
        return 54;
      case ButtonSize.medium:
        return 160;
    }
  }

  static ButtonSize fromAvailableSpace(double width) {
    return width > 600 ? ButtonSize.medium : ButtonSize.small;
  }
}
