import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

/// Component that simulates the glass effect
class GlassComponent extends StatelessWidget {
  /// Widget that should be shown centered in the glass view
  final Widget child;

  /// Background
  final Color color;

  // Border Radius
  final BorderRadius borderRadius;

  // Child padding
  final EdgeInsets padding;

  final bool isCircular;

  /// GlassComponent initializer
  GlassComponent(
      {required this.child,
      this.color = AppColors.white,
      BorderRadius? radius,
      EdgeInsets? insets,
      this.isCircular = false,
      Key? key})
      : borderRadius = radius ?? BorderRadius.circular(isCircular ? 1000 : 10),
        padding = insets ?? const EdgeInsets.fromLTRB(40, 18, 40, 28),
        super(key: key);
        
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecorationExtension.glassEffect(color),
          padding: padding,
          child: child
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final bigger = size.width > size.height ? size.width : size.height;
    return Rect.fromLTWH(0, 0, bigger, bigger);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
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
