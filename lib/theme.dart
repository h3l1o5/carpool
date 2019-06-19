import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.teal,
    accentColor: Colors.pinkAccent,
    textTheme: TextTheme(
      display1: TextStyle(color: Color(0xFF212121), fontSize: 30),
      body1: TextStyle(color: Color(0xFF212121)),
    ),
    hintColor: Color(0xFF212121).withOpacity(.4),
    iconTheme: IconThemeData(color: Color(0xFF212121)),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.2),
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    backgroundColor: Color(0xFF2C2C33),
    primarySwatch: Colors.teal,
    accentColor: Colors.pinkAccent,
    textTheme: TextTheme(
      display1: TextStyle(color: Colors.white.withOpacity(.9), fontSize: 30),
      body1: TextStyle(color: Colors.white.withOpacity(.9)),
      button: TextStyle(color: Colors.white.withOpacity(.9)),
    ),
    hintColor: Colors.white.withOpacity(.4),
    iconTheme: IconThemeData(color: Colors.white.withOpacity(.9)),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.2),
        ),
      ),
    ),
  );
}
