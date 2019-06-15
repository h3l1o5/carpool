import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    accentColor: Colors.teal,
    textTheme: TextTheme(
      body1: TextStyle(color: Color(0xFF212121)),
    ),
    iconTheme: IconThemeData(color: Color(0xFF212121)),
  );

  static ThemeData dark = ThemeData(
    backgroundColor: Color(0xFF2C2C33),
    primarySwatch: Colors.red,
    accentColor: Colors.teal[600],
    errorColor: Colors.redAccent,
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
