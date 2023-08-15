import 'package:desktop_boilerplate/resources/app_colors.dart';
import 'package:desktop_boilerplate/resources/theme.dart';
import 'package:desktop_boilerplate/router.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// MAIN
void main() => runApp(const App());

// APP WIDGET
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final settings = ValueNotifier(ThemeSettings(
    // app color main color
    sourceColor: AppColors.mainColor,
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    // on change light/dark mode, update UI accordingly using observers
    return DynamicColorBuilder(
      builder: ((lightDynamic, darkDynamic) => ThemeProvider(
          settings: settings,
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, child) {
                  final theme = ThemeProvider.of(context);
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: theme.light(settings.value.sourceColor), // light mode
                    darkTheme: theme.dark(settings.value.sourceColor),
                    themeMode: theme.themeMode(),
                    onGenerateRoute: RouterManager.generateRout,
                    initialRoute: Routes.root,
                  );
                }),
          ))),
    );
  }
}
