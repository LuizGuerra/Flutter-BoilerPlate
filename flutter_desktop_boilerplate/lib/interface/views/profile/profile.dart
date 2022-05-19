import 'package:boilerplate/controller/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';

import 'connect.dart';

class Profile extends StatelessWidget {
  final SignUpController signUpController;

  const Profile({required this.signUpController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(signUpController.isDisconnected()) {
      return const Connect();
    }
    return CupertinoPageScaffold(
      child: Container(),
    );
  }
}
