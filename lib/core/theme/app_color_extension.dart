
import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension>{
  final Color bgBtnRedColor;
  final Color greySurfaceLow;
  final Color primary;
  final Color primaryBg;

  AppColorExtension({
    required this.greySurfaceLow,
    required this.bgBtnRedColor,
    required this.primary,
    required this.primaryBg
  });

  @override
  ThemeExtension<AppColorExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorExtension> lerp(covariant ThemeExtension<AppColorExtension>? other, double t) {
    if(other is! AppColorExtension) return this;
    return AppColorExtension(
        greySurfaceLow: Color.lerp(greySurfaceLow, other.greySurfaceLow, t)!,
        bgBtnRedColor:  Color.lerp(bgBtnRedColor, other.bgBtnRedColor, t)!,
        primary:  Color.lerp(primary, other.primary, t)!,
        primaryBg:  Color.lerp(primaryBg, other.primaryBg, t)!
    );
  }
}