import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xFF00FFAB),
      secondary: const Color(0xFF72FFFF),
      surface: const Color(0xFF00FFAB),
      background: Colors.white,
      onBackground: const Color(0xFF172774),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Color(0xFF172774)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Color(0xFF172774)),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF172774)),
      titleMedium: TextStyle(color: Color(0xFF172774)),
      titleSmall: TextStyle(color: Color(0xFF172774)),
      bodyLarge: TextStyle(color: Color(0xFF172774)),
      bodyMedium: TextStyle(color: Color(0xFF172774)),
      bodySmall: TextStyle(color: Color(0xFF172774)),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xFF172774),
      secondary: const Color(0xFFFF0075),
      surface: Colors.white,
      background: Colors.black87,
      onBackground: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
  );
}
