import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        hintColor: Colors.black,
        canvasColor: creamColor,
        backgroundColor: buttonBluishColor,
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
      brightness: Brightness.dark,
      backgroundColor: buttonBluishColor,
      primaryColor: Colors.white,
      canvasColor: darkBluishColor,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ));

  //Colors

  static Color creamColor = const Color.fromARGB(255, 221, 221, 221);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Vx.gray700;
  static Color lightBluishColor = const Color.fromARGB(255, 18, 18, 18);
  static Color buttonBluishColor = const Color.fromARGB(255, 24, 13, 183);
  // static Color pWhiteColor = const Color.fromARGB(255, 255, 255, 255);
  // static Color sWhiteColor = const Color.fromARGB(255, 179, 179, 179);
}
