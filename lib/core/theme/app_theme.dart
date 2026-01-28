
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
      ),
      extensions: [
        AppColorExtension(
            greySurfaceLow: AppColors.greySurveyLow,
            bgBtnRedColor: AppColors.redAccent
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
}

class ColorExtension extends ThemeExtension<ColorExtension>{

  final Color bgErrorBtnColor;

  const ColorExtension({required this.bgErrorBtnColor});

  @override
  ThemeExtension<ColorExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ColorExtension> lerp(ColorExtension other, double t) {
    return ColorExtension(bgErrorBtnColor: Color.lerp(bgErrorBtnColor, other.bgErrorBtnColor, t)!);
  }

}
