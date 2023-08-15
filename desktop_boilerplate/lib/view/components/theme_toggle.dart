import 'package:flutter/material.dart';

import '../../resources/theme.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.dark_mode)
          : const Icon(Icons.light_mode),
      onPressed: () {
        final themeProvider = ThemeProvider.of(context);
        final settings = themeProvider.settings.value;
        final newSettings = ThemeSettings(
          sourceColor: settings.sourceColor,
          themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}
