import 'package:flutter/material.dart';
import 'package:kapoo/pages/root_page.dart';

const String homeRoute = '/';
const String feedRoute = '/feed';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => RootPage(backgroundColor: Color(0xFF333340)),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
