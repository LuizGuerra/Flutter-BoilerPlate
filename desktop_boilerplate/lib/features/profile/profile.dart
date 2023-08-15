import 'package:flutter/material.dart';

import '../login/login.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return const Login();
      // return Scaffold(
      //   appBar: AppBar(),
      //   body: const Center(
      //     child: Text(
      //       "Profile!",
      //     ),
      //   ),
      // );
    });
  }
}
