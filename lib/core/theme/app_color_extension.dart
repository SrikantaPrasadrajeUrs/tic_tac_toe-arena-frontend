import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension>{

  final Color bgBtnColor;

  AppColorExtension({ required this.bgBtnColor });


  @override
  AppColorExtension copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  AppColorExtension lerp(AppColorExtension? other, double t) {
    if(other ==null) return this;
    return AppColorExtension(bgBtnColor: Color.lerp(bgBtnColor, other.bgBtnColor, t)!);
  }

}