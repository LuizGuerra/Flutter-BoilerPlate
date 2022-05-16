import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/widgets.dart';

// https://www.flaticon.com/uicons
// https://design.google.com/icons/
class AppIcons {
  static ImageIcon home = const ImageIcon(AssetImage('assets/icons/home.png'));

  static ImageIcon information = const ImageIcon(AssetImage('assets/icons/information.png'));
  static ImageIcon profile = const ImageIcon(AssetImage('assets/icons/profile.png'), color: AppColors.green);
  static ImageIcon star = const ImageIcon(AssetImage('assets/icons/star.png'));

  static ImageIcon location = const ImageIcon(AssetImage('assets/icons/location.png'));
  static ImageIcon locationRed = const ImageIcon(AssetImage('assets/icons/location-red.png'));

  static ImageIcon leftChevron = const ImageIcon(AssetImage('assets/icons/left-chevron.png'));
  static ImageIcon rightChevron = const ImageIcon(AssetImage('assets/icons/right-chevron.png'));
  static ImageIcon topChevron = const ImageIcon(AssetImage('assets/icons/top-chevron.png'));
  static ImageIcon downChevron = const ImageIcon(AssetImage('assets/icons/down-chevron.png'));
}
