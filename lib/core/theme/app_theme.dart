import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';

class AppTheme{
  static ThemeData dark(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.withValues(alpha: .1),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        )
      ),
      extensions: [
        AppColorExtension(
            greySurfaceLow: AppColors.greySurveyLow,
            bgBtnRedColor: AppColors.redAccent,
            primary: Colors.black,
            primaryBg: Colors.grey.withValues(alpha: .2)
        )
      ],
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 28)
        )
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.withValues(alpha: .3)
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll<Color>(Colors.white)
        )
      )
    );
  }

  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,

      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.withValues(alpha: .08),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

      extensions: [
        AppColorExtension(
          greySurfaceLow: Colors.grey.shade200,
          bgBtnRedColor: Colors.redAccent,
          primary: Colors.white,
          primaryBg: Colors.black.withValues(alpha: .2)
        )
      ],

      textTheme: GoogleFonts.goldmanTextTheme(
        const TextTheme(
          titleLarge: TextStyle(color: Colors.black, fontSize: 28),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: Colors.grey.withValues(alpha: .3),
      ),

      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll<Color>(Colors.black),
        ),
      ),
    );
  }
}