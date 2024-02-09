import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    final ColorScheme kColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 147, 229, 250),
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 42, 51, 59),
    );

    return ThemeData.dark().copyWith(
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
    );
  }

  static ThemeData dark() {
    final ColorScheme kColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 147, 229, 250),
      brightness: Brightness.dark,
      surface: const Color.fromARGB(255, 42, 51, 59),
    );

    return ThemeData.dark().copyWith(
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
    );
  }
}
