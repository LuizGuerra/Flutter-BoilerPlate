import 'dart:convert';

import '../entity/user.dart';
import '../mixin/network_basic_operations_mixin.dart';

// ignore_for_file: overridden_fields
class UserModel with NetworkBasicOperationsMixin {
  // Singleton implementation
  static final UserModel _singleton = UserModel._internal(); // singleton constructor
  UserModel._internal(); // singleton internal init
  factory UserModel() => _singleton; // singleton factory

  // Mixin overrites example
  @override
  String branchPath = "login";

  // If there is conected user
  User? _user;

  bool isConnected() => _user != null;

  Future<String> login(String email, String password) async {
    final response = await get(queryParameters: {"email": email, "password": password});
    if(response == null) return "";
    _user = User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return response.body;
  }
}
