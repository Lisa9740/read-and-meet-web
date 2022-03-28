import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palettes/color.palette.dart';

class AppTheme {
  static const mainColor = Color(0xffA03E99);
  static const secondColor =  Color(0xff5A4554);

  static ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Palette.purpleColor, primaryColorDark: mainColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Raleway',
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: mainColor,
            fixedSize: const Size(250, 60)
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
        headline1: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline3: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline4: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headline5: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineLarge: GoogleFonts.raleway(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyText1:  const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        bodyText2:  const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),
      ),

    );
  }
}