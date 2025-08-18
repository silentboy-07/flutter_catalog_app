import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
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
      labelSmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluishColor,
      foregroundColor: white,
      elevation: 2.0,
      shape: const CircleBorder(),
      sizeConstraints: const BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 50,
        maxHeight: 50,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(darkBluishColor),
        foregroundColor: WidgetStateProperty.all(white),
        elevation: WidgetStateProperty.all(2.0),
        shape: WidgetStateProperty.all(const StadiumBorder()),
        minimumSize: WidgetStateProperty.all(const Size(50, 50)),
      ),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    scaffoldBackgroundColor: darkCreamColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
      labelSmall: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightBluishColor,
      foregroundColor: white,
      elevation: 2.0,
      shape: const CircleBorder(),
      sizeConstraints: const BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 50,
        maxHeight: 50,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(lightBluishColor),
        foregroundColor: WidgetStateProperty.all(white),
        elevation: WidgetStateProperty.all(2.0),
        shape: WidgetStateProperty.all(const StadiumBorder()),
        minimumSize: WidgetStateProperty.all(const Size(50, 50)),
      ),
    ),
  );

  // Color palette
  static Color creamColor = const Color(0xFFF5F5F5); // Soft background
  static Color darkBluishColor = const Color(0xFF2C2C54); // Dark navy-purple
  static Color white = const Color(0xFFFFFFFF); // White
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
}
