import 'package:flutter/material.dart';

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color bgBtnColor;
  final Color greySurfaceLow;
  final Color greySurfaceMid;
  final Color greySurfaceHigh;
  final Color neutralGrey;
  final Color primary;
  final Color inversePrimary;
  final Color primaryBg;

  const AppColorExtension({
    required this.bgBtnColor,
    required this.greySurfaceLow,
    required this.greySurfaceMid,
    required this.greySurfaceHigh,
    required this.neutralGrey,
    required this.primary,
    required this.inversePrimary,
    required this.primaryBg,
  });

  @override
  AppColorExtension copyWith({
    Color? bgBtnColor,
    Color? greySurfaceLow,
    Color? greySurfaceMid,
    Color? greySurfaceHigh,
    Color? neutralGrey,
    Color? primary,
    Color? inversePrimary,
    Color? primaryBg,
  }) {
    return AppColorExtension(
      bgBtnColor: bgBtnColor ?? this.bgBtnColor,
      greySurfaceLow: greySurfaceLow ?? this.greySurfaceLow,
      greySurfaceMid: greySurfaceMid ?? this.greySurfaceMid,
      greySurfaceHigh: greySurfaceHigh ?? this.greySurfaceHigh,
      neutralGrey: neutralGrey ?? this.neutralGrey,
      primary: primary ?? this.primary,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      primaryBg: primaryBg ?? this.primaryBg,
    );
  }

  @override
  AppColorExtension lerp(
      ThemeExtension<AppColorExtension>? other,
      double t,
      ) {
    if (other is! AppColorExtension) return this;

    return AppColorExtension(
      bgBtnColor: Color.lerp(bgBtnColor, other.bgBtnColor, t)!,
      greySurfaceLow: Color.lerp(greySurfaceLow, other.greySurfaceLow, t)!,
      greySurfaceMid: Color.lerp(greySurfaceMid, other.greySurfaceMid, t)!,
      greySurfaceHigh: Color.lerp(greySurfaceHigh, other.greySurfaceHigh, t)!,
      neutralGrey: Color.lerp(neutralGrey, other.neutralGrey, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      primaryBg: Color.lerp(primaryBg, other.primaryBg, t)!,
    );
  }
}