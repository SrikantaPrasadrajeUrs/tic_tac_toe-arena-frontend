import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';

import 'app_text_styles.dart';

class AppTheme{
  static ThemeData dark(){
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary
      ),
      inputDecorationTheme: InputDecorationTheme(

      ),
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: AppTextStyles.title,
          bodyMedium: AppTextStyles.subtitle,
        )
      ),

      extensions: [
        AppColorExtension(bgBtnColor: AppColors.lightGrey)
      ]
    );
  }
}