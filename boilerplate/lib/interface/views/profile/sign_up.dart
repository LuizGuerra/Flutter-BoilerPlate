import 'package:boilerplate/interface/components/reusable_button.dart';
import 'package:boilerplate/interface/views/profile/user_flux.dart';
import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../router/routes.dart';
import '../../components/reusable_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return UserFluxPageScaffold(
      withBackButton: true,
      "Sign Up",
      child: Column(
        children: [
          const SizedBox(height: 44),
          ReusableTextField(
              controller: _emailController,
              placeholder: "E-mail",
              finality: TextFieldFinality.email),
          const SizedBox(height: 8),
          ReusableTextField(
              controller: _passwordController,
              placeholder: "Password",
              finality: TextFieldFinality.password),
          const SizedBox(height: 16),
          _richText(),
          const SizedBox(height: 36),
          ReusableButton("Agree and Continue",
              onPressed: loginAction, configuration: ButtonConfigurations.main()),
          const SizedBox(height: 8),
          ReusableButton("Login",
              onPressed: () {
                Navigator.of(context).popAndPushNamed(Routes.login);
              },
              configuration: ButtonConfigurations.secondary()),
        ],
      ),
    );
  }

  Widget _richText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: AppColors.white),
          children: <TextSpan>[
            const TextSpan(
                text: "By selecting Agree and continue below, I agree to "),
            _orangeText("Terms of Service"),
            const TextSpan(text: " and "),
            _orangeText("Privacy Policy.")
          ],
        ),
      ),
    );
  }

  TextSpan _orangeText(String content) {
    return TextSpan(
        text: content, style: const TextStyle(color: AppColors.opositeColor));
  }

  void loginAction() {

  }
}
