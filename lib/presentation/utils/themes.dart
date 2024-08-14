import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white, // Color del texto del AppBar en modo claro
  ),
  textTheme: TextTheme(
    titleLarge:
        TextStyle(color: Colors.black, fontSize: 20), // Título del AppBar
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16), // Texto normal
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[900],
    foregroundColor: Colors.white, // Color del texto del AppBar en modo oscuro
  ),
  textTheme: TextTheme(
    titleLarge:
        TextStyle(color: Colors.white, fontSize: 20), // Título del AppBar
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16), // Texto normal
  ),
);
