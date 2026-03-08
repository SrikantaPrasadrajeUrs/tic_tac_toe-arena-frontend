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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: AppTextStyles.title,
          bodyMedium: AppTextStyles.subtitle,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.lightGrey2,
      ),
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
          neutralGrey: AppColors.nGrey,
          primary: Colors.black,
          primaryBg: Colors.grey.withValues(alpha: .2),
          inversePrimary: Colors.white
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
              blurRadius: 12,
              spreadRadius: 4,
              offset: Offset(0, 6),
            ),
          ],
        ),
      ],
    );
  }
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.lightGrey1.withValues(alpha: .3),
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

      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: AppTextStyles.title.copyWith(color: Colors.black),
          bodyMedium: AppTextStyles.subtitle.copyWith(color: Colors.black87),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: AppColors.lightGrey2.withValues(alpha: .15),
      ),

      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),

      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0
      ),

      extensions: [
        AppColorExtension(
          bgBtnColor: AppColors.lightGrey1.withValues(alpha: .5),
          greySurfaceLow: AppColors.lightGrey1,
          greySurfaceMid: AppColors.lightGrey2,
          greySurfaceHigh: AppColors.lightGrey3,
          neutralGrey: AppColors.nGrey,
          primary: Colors.white,
          primaryBg: Colors.black.withValues(alpha: .05),
          inversePrimary: Colors.black
        ),

        AppShadowExtension(
          low: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          mid: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          high: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .12),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ],
    );
  }
}
