import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double radiusSize = 4.0;
const double margin = 10.0;
const double hintOpacity = .5;
const double cardBorderSideWidth = 10.0;
const double cardBorderSideStrokeAlign = 1.0;

ColorScheme get colorScheme => ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 253, 169, 238),
    );

ThemeMode themeMode() => ThemeMode.dark;

ThemeData mainTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(margin),
        color: colorScheme.primary,
        shadowColor: Colors.black,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme.primaryContainer,
            width: cardBorderSideWidth,
            strokeAlign: cardBorderSideStrokeAlign,
          ),
          borderRadius: BorderRadius.circular(radiusSize),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSize),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        fillColor: Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(
          color: colorScheme.outline.withOpacity(hintOpacity),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(margin),
      ),
      textTheme: GoogleFonts.rosarioTextTheme().copyWith(
        bodyLarge: GoogleFonts.rosario(),
        bodyMedium: GoogleFonts.rosario(),
      ),
    );
