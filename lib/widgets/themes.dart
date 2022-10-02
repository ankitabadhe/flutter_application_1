import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        hintColor: Colors.black,
        canvasColor: creamColor,
        primaryColor: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      hintColor: Colors.white,
      cardColor: lightBluishColor,
      primaryColor: Colors.white,
      canvasColor: darkCreamColor,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //Colors

  static Color creamColor = const Color.fromARGB(255, 221, 221, 221);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color.fromARGB(255, 85, 81, 105);
  static Color lightBluishColor = const Color.fromARGB(184, 27, 57, 102);
}
