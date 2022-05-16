import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../resources/app_colors.dart';

/// Component that simulates the glass effect
class GlassComponent extends StatelessWidget {
  /// Widget that should be shown centered in the glass view
  final Widget child;

  /// Background
  final Color color;

  /// GlassComponent initializer
  const GlassComponent(
      {required this.child, this.color = AppColors.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecorationExtension.glassEffect(color),
          padding: const EdgeInsets.fromLTRB(40, 18, 40, 28),
          child: child,
        ),
      ),
    );
  }
}

/// Glass style decoration
extension BoxDecorationExtension on BoxDecoration {
  /// Glass effect
  static BoxDecoration glassEffect(Color color) {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: const Alignment(0.2, 0),
      end: const Alignment(0.8, 1),
      colors: <Color>[color.withOpacity(0.4), color.withOpacity(0.1)],
    ));
  }
}
