import 'package:flutter/material.dart';

/// The application's dark theme.
ThemeData syncShopDarkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xff2e7d44),
      secondary: Color(0xFFA89780),
      tertiary: Color(0xFFEADDD7), // icon color
      surface: Color(0xFF484848),
      surfaceVariant: Color(0xFFF1F1F1),
      background: Color(0xff2f2f2f),
      error: Color.fromRGBO(184, 61, 60, 1.0),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 40.0, color: Colors.white),
        titleMedium: TextStyle(fontSize: 34.0, color: Colors.white),
        titleSmall: TextStyle(fontSize: 24.0, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 24.0, color: Color(0xFFf5f7f8)),
        bodyMedium:
            TextStyle(fontSize: 18.0, color: Color(0xFFF1F1F1)),
        bodySmall: TextStyle(color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    )));

/// The application's light theme.
ThemeData syncShopLightTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xff2e7d44),
      secondary: Color(0xff2f2f2f),
      tertiary: Color(0xff2f2f2f), // icon color
      surface: Color(0xFFf5f7f8),
      surfaceVariant: Color(0xFF484848),
      background: Color(0xFFf5f7f8),
      error: Color.fromRGBO(184, 61, 60, 1.0),
      onPrimary: Color(0xff2f2f2f),
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 40.0, color: Colors.black),
      titleMedium: TextStyle(fontSize: 34.0, color: Colors.black),
      titleSmall: TextStyle(fontSize: 24.0, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 24.0, color: Color(0xff2f2f2f)),
      bodyMedium: TextStyle(fontSize: 18.0, color: Color(0xff2f2f2f)),
      bodySmall: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    )));
