import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xFFB7935F);
  static Color secondaryColor = const Color(0xFF141A2E);
  static Color whiteColor = const Color(0xFFF8F8F8);
  static Color blackColor = const Color(0xFF242424);
  static Color darkYellowColor = const Color(0xFFFACC1D);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      labelSmall: GoogleFonts.elMessiri(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: blackColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 25.0,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      labelSmall: GoogleFonts.elMessiri(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: whiteColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondaryColor,
      selectedItemColor: darkYellowColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
    ),
  );
}
