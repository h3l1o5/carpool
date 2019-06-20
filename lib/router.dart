import 'package:flutter/material.dart';
import 'package:kapoo/blocs/auth_bloc.dart';
import 'package:kapoo/pages/authenticate/authenticate.dart';
import 'package:kapoo/pages/authenticate/sign_up.dart';
import 'package:kapoo/pages/edit-profile/edit_profile.dart';
import 'package:kapoo/pages/root_page.dart';
import 'package:provider/provider.dart';

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
          builder: (context) {
            final authBloc = Provider.of<AuthBloc>(context);
            final user = authBloc.getUser();

            return EditProfile(user: user);
          },
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
