import 'package:desktop_boilerplate/view/components/theme_toggle.dart';
import 'package:flutter/material.dart';

import '../../extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // If desktop
      return Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [const ThemeToggle().padding(Edge.all, 20)],
              )
            ],
          ),
        ),
      ));
    });
  }
}
