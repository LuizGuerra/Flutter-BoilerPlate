import 'package:flutter/material.dart';
import 'package:flutter_desktop_boilerplate/controller/input_controller.dart';
import 'package:flutter_desktop_boilerplate/interface/components/reusable_button.dart';
import 'package:flutter_desktop_boilerplate/interface/components/reusable_text_field.dart';
import 'package:flutter_desktop_boilerplate/interface/components/widget_reusable_button.dart';

import '../../resources/app_colors.dart';

class ConnectForm extends StatefulWidget {
  final TextEditingController emailController, passwordController;
  final Function onComplete;
  const ConnectForm(
      {required this.emailController,
      required this.passwordController,
      required this.onComplete,
      Key? key})
      : super(key: key);

  @override
  State<ConnectForm> createState() => _ConnectFormState();
}

class _ConnectFormState extends State<ConnectForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("E-mail", style: TextStyle(fontWeight: FontWeight.w200)),
          const SizedBox(height: 4),
          ReusableTextField(
              placeholder: "e-mail",
              controller: widget.emailController,
              finality: TextFieldFinality.email),
          badFeedbackSpace(true),
          const Text("Password", style: TextStyle(fontWeight: FontWeight.w200)),
          const SizedBox(height: 4),
          ReusableTextField(
              placeholder: "password",
              controller: widget.passwordController,
              finality: TextFieldFinality.password),
          badFeedbackSpace(false),
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
          ReusableButton("Connect", onPressed: buttonAction),
        ],
      ),
    );
  }

  List<LoginInputFlag> _inputFlag = [];
  ConnectingStatus connectingFlag = ConnectingStatus.notConnecting;

  Widget badFeedbackSpace(bool isEmail) {
    if (_inputFlag.isEmpty) {
      return const SizedBox(height: 8);
    }
    String errors = "";
    if (isEmail) {
      if (_inputFlag.contains(LoginInputFlag.emptyEmail)) {
        errors = "Field cannot be empty.";
      } else if (_inputFlag.contains(LoginInputFlag.invalidEmail)) {
        errors = "Invalid e-mail format.";
      } else {
        return const SizedBox(height: 8);
      }
    } else {
      if (_inputFlag.contains(LoginInputFlag.emptyPassword)) {
        errors = "Field cannot be empty.";
      } else if (_inputFlag.contains(LoginInputFlag.shortPassword)) {
        errors = "Password too short.";
      } else {
        return const SizedBox(height: 8);
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 2),
        Text(errors,
            style: const TextStyle(
                fontWeight: FontWeight.w200, color: AppColors.red)),
        const SizedBox(height: 8),
      ],
    );
  }

  void buttonAction() {
    _inputFlag = InputController().emailAndPassword(
        widget.emailController.text, widget.passwordController.text);
    setState(() {});
    if (_inputFlag.isEmpty) {
      widget.onComplete;
    }
  }
}

enum ConnectingStatus {
  notConnecting,
  connecting,
  failedConneciton;
}
