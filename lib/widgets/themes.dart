import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primaryColor: primaryColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: creamColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.black87, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: Colors.black54, fontSize: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  // Color palette
  static Color primaryColor = const Color(0xFF5A4FCF); // Modern purple-blue
  static Color accentColor = const Color(
    0xFFFFA726,
  ); // Warm amber for highlights
  static Color creamColor = const Color(0xFFF5F5F5); // Soft background
  static Color darkBluishColor = const Color(0xFF2C2C54); // Dark navy-purple
  static Color white = const Color(0xFFFFFFFF); // Dark navy-purple
}
