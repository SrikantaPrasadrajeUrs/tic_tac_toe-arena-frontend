import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/theme/app_shadow_extension.dart';

import 'app_text_styles.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.dark(primary: AppColors.primary),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.lightGrey1,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: AppTextStyles.title,
          bodyMedium: AppTextStyles.subtitle,
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColors.lightGrey2),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
      ),
      appBarTheme: AppBarThemeData(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.black,
      ),
      extensions: [
        AppColorExtension(
          bgBtnColor: AppColors.lightGrey1,
          greySurfaceLow: AppColors.lightGrey1,
          greySurfaceMid: AppColors.lightGrey2,
          greySurfaceHigh: AppColors.lightGrey3,
          neutralGrey: AppColors.nGrey
        ),

        AppShadowExtension(
          low: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 4,
              spreadRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
          mid: [
            BoxShadow(
              color: AppColors.shadowMedium,
              blurRadius: 8,
              spreadRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          high: [
            BoxShadow(
              color: AppColors.shadowStrong,
              blurRadius: 12,spreadRadius: 4,

              offset: Offset(0, 6),
            ),
          ],
        )
      ],
    );
  }
}
