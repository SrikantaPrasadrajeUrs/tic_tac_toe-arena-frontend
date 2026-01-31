import 'package:flutter/material.dart';

@immutable
class AppShadowExtension extends ThemeExtension<AppShadowExtension> {
  final List<BoxShadow> low;
  final List<BoxShadow> mid;
  final List<BoxShadow> high;

  const AppShadowExtension({
    required this.low,
    required this.mid,
    required this.high,
  });

  @override
  AppShadowExtension copyWith({
    List<BoxShadow>? low,
    List<BoxShadow>? mid,
    List<BoxShadow>? high,
  }) {
    return AppShadowExtension(
      low: low ?? this.low,
      mid: mid ?? this.mid,
      high: high ?? this.high,
    );
  }

  @override
  AppShadowExtension lerp(
      ThemeExtension<AppShadowExtension>? other,
      double t,
      ) {
    if (other is! AppShadowExtension) return this;

    return AppShadowExtension(
      low: BoxShadow.lerpList(low, other.low, t)!,
      mid: BoxShadow.lerpList(mid, other.mid, t)!,
      high: BoxShadow.lerpList(high, other.high, t)!,
    );
  }
}
