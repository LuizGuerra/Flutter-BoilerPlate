import 'package:boilerplate/model/network/user_model.dart';

class SignUpController {
  UserModel singleton = UserModel();
  
  // Try to log in, if can return true, otherwise false
  Future<bool> login(String email, String password) async {
    return (await singleton.login(email, password)).isNotEmpty;
  }

  bool isConnected() {
    return singleton.isConnected();
  }

  bool isDisconnected() {
    return !singleton.isConnected();
  }
}
