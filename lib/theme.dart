import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primarySwatch: Colors.pink,
    accentColor: Colors.teal,
    textTheme: TextTheme(
      body1: TextStyle(color: Color(0xFF212121)),
    ),
    iconTheme: IconThemeData(color: Color(0xFF212121)),
  );

  static ThemeData dark = ThemeData(
    backgroundColor: Color(0xFF333340),
    brightness: Brightness.dark,
    primarySwatch: Colors.pink,
    accentColor: Colors.teal,
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
