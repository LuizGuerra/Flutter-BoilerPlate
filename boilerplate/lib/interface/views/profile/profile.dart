import 'package:boilerplate/model/network/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'connect.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(UserModel().isDisconected()) {
      return const Connect();
    }
    return CupertinoPageScaffold(
      child: Container(),
    );
  }
}
