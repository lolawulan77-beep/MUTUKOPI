import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    // WARNA UTAMA (tema kopi)
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF5D4037),     // roasted brown
      secondary: const Color(0xFFD7A86E),   // caramel gold
      surface: const Color(0xFFEFEBE9),     // cream
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),

    // APPBAR COFFEE STYLE
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3E2723),      // dark coffee
      foregroundColor: Colors.white,           // text white
      centerTitle: true,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    // BUTTON COFFEE STYLE
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFF5D4037)),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    ),

    // TEKS STYLE GLOBAL
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFF3E2723),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: Color(0xFF3E2723)),
      bodyMedium: TextStyle(color: Color(0xFF5D4037)),
    ),
  );
}
