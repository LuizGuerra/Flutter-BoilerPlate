import 'package:boilerplate/resources/app_strings.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  // Singleton implementation
  static final Storage _singleton = Storage._internal(); // singleton constructor
  Storage._internal(); // singleton internal init
  factory Storage() => _singleton; // singleton factory

  // Local Storage keys example
  static final tokenStorage = new LocalStorage(AppStrings.storageKeys.token);
  static final registrationStorage = new LocalStorage(AppStrings.storageKeys.registration);
}
