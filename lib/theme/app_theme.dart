// ===========================================================================
// app_theme.dart  -  the visual style of the whole app.
//
// Instead of styling every button and app bar by hand, we set the style ONCE
// here. MaterialApp uses it, and every widget inherits it automatically.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AppTheme {
  // A "static" value belongs to the class itself, so we can write
  // AppTheme.light without creating an object first.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true, // use the modern Material 3 look
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: const Color(0xFFF3F6F8), // light grey page

      // ---- APP BAR (top bar) default look ----
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white, // white title + icons
        centerTitle: true,
        elevation: 0,
      ),

      // ---- ELEVATED BUTTON default look ----
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50), // full-width, 50 tall
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ---- TEXT FIELD default look ----
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(), // box around every text field
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
