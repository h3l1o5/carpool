import 'package:flutter/material.dart';
import 'package:kapoo/pages/authenticate/authenticate.dart';
import 'package:kapoo/pages/authenticate/sign_up.dart';
import 'package:kapoo/pages/edit-profile/edit_profile.dart';
import 'package:kapoo/pages/root_page.dart';

const String rootPageRoute = '/';
const String authenticateRoute = '/auth';
const String signUpRoute = "/auth/signUp";
const String editProfileRoute = "/edit-profile";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootPageRoute:
        return MaterialPageRoute(
          builder: (_) => RootPage(),
        );
      case authenticateRoute:
        return MaterialPageRoute(
          builder: (_) => Authenticate(),
          fullscreenDialog: true,
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case editProfileRoute:
        return MaterialPageRoute(
          builder: (_) => EditProfile(),
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
