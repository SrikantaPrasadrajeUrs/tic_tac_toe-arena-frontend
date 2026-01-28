
import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension>{
  final Color bgBtnRedColor;
  final Color greySurfaceLow;

  AppColorExtension({
    required this.greySurfaceLow,
    required this.bgBtnRedColor
  });

  @override
  ThemeExtension<AppColorExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppColorExtension> lerp(covariant ThemeExtension<AppColorExtension>? other, double t) {
    return this;
  }

}