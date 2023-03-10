import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      fontStyle: FontStyle.italic,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
    ),
    labelSmall: TextStyle(
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

TextStyle textStyleLightRed = const TextStyle(
  color: Colors.red,
  fontFamily: 'Cerebrisans',
  fontWeight: FontWeight.w400,
  fontSize: 13,
);
