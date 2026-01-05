
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData dark(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 28)
        )
      )
    );
  }
}