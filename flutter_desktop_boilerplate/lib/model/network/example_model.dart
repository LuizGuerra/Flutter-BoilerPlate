import 'package:boilerplate/model/mixin/network_basic_operations_mixin.dart';

class ExampleModel with NetworkBasicOperationsMixin {
  // Singleton implementation
  static final ExampleModel _singleton = ExampleModel._internal(); // singleton constructor
  ExampleModel._internal(); // singleton internal init
  factory ExampleModel() => _singleton; // singleton factory

  // Mixin overrites example
  @override String root = "google.com";
  @override String branchPath = "user";

  // Model functions
  Future<String> getSomething() async {
    final response = await get(additionalPath: "example/request");
    if (response == null) return "";
    return response.body;
  }
}
