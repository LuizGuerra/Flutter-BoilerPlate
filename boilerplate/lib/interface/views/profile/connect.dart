import 'package:boilerplate/interface/components/reusable_button.dart';
import 'package:boilerplate/interface/views/profile/user_flux.dart';
import 'package:boilerplate/resources/app_strings.dart';
import 'package:boilerplate/router/routes.dart';
import 'package:flutter/cupertino.dart';

class Connect extends StatelessWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserFluxPageScaffold(
      "Connect",
      child: Column(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: [
          const Text(
            "Make an account to enjoy all our features!",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          ReusableButton(
            "Login",
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.login);
            },
            configuration: ButtonConfigurations.main(),
          ),
          const SizedBox(height: 16),
          ReusableButton(
            "Sign Up",
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.signUp);
            },
            configuration: ButtonConfigurations.secondary(),
          ),
          const SizedBox(height: 16),
          Image.asset(
            AppStrings.images.people,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
