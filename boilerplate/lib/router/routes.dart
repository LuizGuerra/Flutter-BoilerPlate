
/// Enum that contains all route localized Strings
enum Routes {
  root,
  // home,
  home, home_follow_up,
  profile,
  error
}

extension RoutesFunctions on Routes {
  String localized() {
    if(this == Routes.root) {
      return "/";
    }
    return "/$name";
  }
}

// class Routes {
//   /// Application's first screen
//   static const String root = "";
//   /// Home view localized screen
//   static const String home = "home";
//   static const String homeFollowUp = "home-follow-up";
  
//   static const String error = "error";

//   /// Sign Up view localized string
//   static const String profile = "profile";

// }