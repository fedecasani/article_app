import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.black, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
  ),
);
