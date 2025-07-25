import 'package:flutter/material.dart';

class BolotoTheme {
  // Colors
  static const Color background = Color(0xFF142623);
  static const Color primaryAccent = Color(0xFF398C7D);
  static const Color secondaryAccent = Color(0xFF3FAF8F);
  static const Color textOnDark = Color(0xFFF0D48C);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryAccent,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: textOnDark),
        titleLarge: TextStyle(
          color: textOnDark,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryAccent,
          foregroundColor: background,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
