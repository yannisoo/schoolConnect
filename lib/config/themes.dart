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
      fontFamily: 'Hind',
    ),
  ),
);
