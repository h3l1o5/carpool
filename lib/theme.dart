import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    accentColor: Colors.teal,
    textTheme: TextTheme(
      display1: TextStyle(color: Color(0xFF212121), fontSize: 30),
      body1: TextStyle(color: Color(0xFF212121)),
    ),
    hintColor: Color(0xFF212121).withOpacity(.4),
    iconTheme: IconThemeData(color: Color(0xFF212121)),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF212121).withOpacity(.2),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF212121).withOpacity(.2),
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    backgroundColor: Color(0xFF2C2C33),
    primarySwatch: Colors.red,
    accentColor: Colors.teal[600],
    textTheme: TextTheme(
      display1: TextStyle(color: Colors.white, fontSize: 30),
      body1: TextStyle(color: Colors.white),
    ),
    hintColor: Colors.white.withOpacity(.4),
    iconTheme: IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.2),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.2),
        ),
      ),
    ),
  );
}
