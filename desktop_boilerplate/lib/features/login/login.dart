import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';
import '../../view/components/connect_form.dart';
import '../../view/components/glass_component.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimension) {
      final isBigScreen = dimension.maxWidth >= 600;
      final width = isBigScreen ? dimension.maxWidth / 2 : dimension.maxWidth;
      final height =
          isBigScreen ? dimension.maxHeight : dimension.maxHeight / 2;
      final widgets = [
        Expanded(
          child: leftWidget(),
        ),
        Expanded(child: rightWidget(height, width))
      ];
      return Scaffold(
          body: isBigScreen
              ? Row(children: widgets)
              : Column(children: widgets.reversed.toList()));

      // return Scaffold(
      //   body: Column(
      //     children: [
      //       Flexible(
      //         flex: 1,
      //         child: Image.asset(AppStrings.images.background,
      //             width: width, fit: BoxFit.contain),
      //       ),
      //       Flexible(flex: 2, child: Container()),
      //     ],
      //   ),
      // );
    });
  }

  // Widget leftWidget() {
  //   return Container();
  // }

  // Widget rightWidget(double? height, double width, bool isBigScreen) {
  //   return Image.asset(AppStrings.images.background, fit: BoxFit.cover);
  //   // return Image.asset(AppStrings.images.background,
  //   //     height: height, width: width, fit: BoxFit.cover);
  // }

  // Widget rightsdasWidget(double height, double width) {
  //   return Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Image.asset(AppStrings.images.background,
  //           height: height, width: width, fit: BoxFit.cover),
  //       GlassComponent(
  //           insets: const EdgeInsets.all(60), child: const Text("Brand Name.")),
  //       // const EdgeInsets.all(20)
  //     ],
  //   );
  // }

  Widget leftWidget() {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("Luiz Guerra & et. al.",
                style: TextStyle(fontWeight: FontWeight.w200)),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40),
                constraints: const BoxConstraints(maxWidth: 400),
                child: ConnectForm(
                    emailController: TextEditingController(),
                    passwordController: TextEditingController(),
                    onComplete: () {}),
              ),
            )),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text("◍ Luiz Guerra's Flutter Boilerplate 2022",
                style: TextStyle(fontWeight: FontWeight.w100)),
          ),
        ),
      ],
    );
  }

  Widget rightWidget(double height, double width) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AppStrings.images.background,
            height: height, width: width, fit: BoxFit.cover),
        GlassComponent(
            insets: const EdgeInsets.all(60), child: const Text("Brand Name.")),
        // const EdgeInsets.all(20)
      ],
    );
  }
}
