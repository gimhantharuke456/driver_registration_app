import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    appBarTheme: appBarTheme,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme, // Added input decoration theme
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    appBarTheme: appBarTheme,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme, // Added input decoration theme
  );

  // Text Theme
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 30,
    ),
    bodyMedium: GoogleFonts.poppins(),
    displaySmall: GoogleFonts.poppins(),
  );
  //app bar theme
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontFamily: GoogleFonts.ubuntu().fontFamily),
    centerTitle: true,
  );
  // Input Field Theme
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );
}
