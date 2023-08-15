import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

enum LoginInputFlag {
  emptyEmail, invalidEmail,
  emptyPassword, shortPassword
}

// extension LoginInputFlagMessage on LoginInputFlag {
//   String errorMessage() {
//     switch (this) {
//       case LoginInputFlag.emptyEmail: return "Field cannot be empty.";
//       case LoginInputFlag.invalidEmail: return "Invalid e-mail format.";
//       case LoginInputFlag.emptyPassword: return "Field cannot be empty.";
//       case LoginInputFlag.shortPassword: return "Password too short.";
//     }
//   }
// }

class InputController {
  List<LoginInputFlag> emailAndPassword(String email, String password) {
    List<LoginInputFlag> list = [];
    if (email.isEmpty) {
      list.add(LoginInputFlag.emptyEmail);
    }
    if(!Fzregex.hasMatch(email, FzPattern.email)){
      list.add(LoginInputFlag.invalidEmail);
    }
    if (password.isEmpty) {
      list.add(LoginInputFlag.emptyPassword);
    }
    if (password.length <= 5) {
      list.add(LoginInputFlag.shortPassword);
    }
    return list;
  }
}