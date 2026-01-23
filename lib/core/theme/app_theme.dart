
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData dark(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.withValues(alpha: .3),
        filled: true,
      ),
      extensions: [
        // ColorExtension()
      ],
      textTheme: GoogleFonts.goldmanTextTheme(
        TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 28)
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
