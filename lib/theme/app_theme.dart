import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color backgroundLight = Color(0xFFF6F7F8);
  static const Color backgroundDark = Color(0xFF101822);
  static const Color cardColorLight = Colors.white;
  static const Color cardColorDark = Color(0xFF1C2733);

  static ThemeData lightTheme(Color accentColor) {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      primaryColor: accentColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accentColor,
        brightness: Brightness.light,
        surface: backgroundLight,
      ),
      scaffoldBackgroundColor: backgroundLight,
      cardTheme: base.cardTheme.copyWith(
        color: cardColorLight,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: accentColor.withOpacity(0.05)),
        ),
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData darkTheme(Color accentColor) {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      primaryColor: accentColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accentColor,
        brightness: Brightness.dark,
        surface: backgroundDark,
      ),
      scaffoldBackgroundColor: backgroundDark,
      cardTheme: base.cardTheme.copyWith(
        color: cardColorDark,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: accentColor.withOpacity(0.1)),
        ),
      ),
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
