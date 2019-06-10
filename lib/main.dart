import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kapoo/side_menu_scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: SideMenuScaffold(
        backgroundColor: Color(0xFF333340),
      ),
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
