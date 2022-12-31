import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 36,
      fontStyle: FontStyle.italic,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
    ),
    overline: TextStyle(
      fontSize: 10,
    ),
  ),
);

class Margins {
  static const double m8 = 8;
  static const double m4 = 4;
  static const double m2 = 2;
  static const double m16 = 16;
  static const double m32 = 32;
  static const double m24 = 24;
  static const double m62 = 62;
  static const double m80 = 80;
}

TextStyle get textStyleLightRed => const TextStyle(
      color: Colors.red,
      fontFamily: 'Cerebrisans',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );
