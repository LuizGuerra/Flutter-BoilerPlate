import 'package:boilerplate/interface/views/profile/user_flux.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';

import '../../components/reusable_button.dart';
import '../../components/reusable_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return UserFluxPageScaffold(
      withBackButton: true,
      "Login",
      child: Column(
        children: [
          ReusableTextField(
              controller: _emailController,
              placeholder: "E-mail",
              finality: TextFieldFinality.email),
          const SizedBox(height: 8),
          ReusableTextField(
              controller: _passwordController,
              placeholder: "Password",
              finality: TextFieldFinality.password),
          const SizedBox(height: 36),
          ReusableButton("Connect",
              onPressed: loginAction,
              configuration: ButtonConfigurations.main()),
          const SizedBox(height: 8),
          ReusableButton("Create account", onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.signUp);
          }, configuration: ButtonConfigurations.secondary()),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  void loginAction() {}
}
