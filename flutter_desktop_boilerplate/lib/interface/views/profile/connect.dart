import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/interface/components/connect_form.dart';
import 'package:flutter_desktop_boilerplate/interface/components/glass_view.dart';
import 'package:flutter_desktop_boilerplate/interface/components/reusable_button.dart';
import 'package:flutter_desktop_boilerplate/interface/components/reusable_text_field.dart';
import 'package:flutter_desktop_boilerplate/interface/components/widget_reusable_button.dart';
import 'package:flutter_desktop_boilerplate/resources/app_colors.dart';
import 'package:flutter_desktop_boilerplate/resources/app_strings.dart';

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 2;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: leftWidget(),
          ),
          Expanded(child: rightWidget(height, width)),
        ],
      ),
    );
  }

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
              // child: connectForms(),
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

  Widget connectForms() {
    return Container(
      padding: const EdgeInsets.all(40),
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("E-mail", style: TextStyle(fontWeight: FontWeight.w200)),
          const SizedBox(height: 4),
          // TODO: controller
          ReusableTextField(
              placeholder: "e-mail",
              controller: TextEditingController(),
              finality: TextFieldFinality.email),
          const SizedBox(height: 8),
          const Text("Password", style: TextStyle(fontWeight: FontWeight.w200)),
          const SizedBox(height: 4),
          // TODO: controller
          ReusableTextField(
              placeholder: "password",
              controller: TextEditingController(),
              finality: TextFieldFinality.password),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            WidgetReusableButton(
              onPressed: () {},
              configuration: WidgetButtonConfigurations.plain(),
              child: const Text("Forgot password",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w200,
                      decoration: TextDecoration.underline)),
            )
          ]),
          ReusableButton("Connect", onPressed: () {}),
          const SizedBox(height: 8),
          ReusableButton(
            "Sign Up",
            onPressed: () {},
            configuration: ButtonConfigurations.secondary(),
          ),
        ],
      ),
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
