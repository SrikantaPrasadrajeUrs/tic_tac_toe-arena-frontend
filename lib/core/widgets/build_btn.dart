import 'package:flutter/material.dart';

class BuildBtn extends StatelessWidget {
  final Color? bgColor;
  final String? text;
  final TextStyle? style;
  final String? imagePath;
  final double? height;
  final double? width;
  final double? circularRadius;
  final bool? requireCircularRadius;
  final List<BoxShadow>? shadows;

  const BuildBtn({
    super.key,
    this.text,
    this.imagePath,
    this.bgColor,
    this.style,
    this.width,
    this.height,
    this.circularRadius = 25,
    this.requireCircularRadius,
    this.shadows,
  });

  final double defaultHeight = 60;
  final double defaultWidth = double.infinity;

  double getRadius() {
    double? radius;
    if (requireCircularRadius == true) {
      radius = (((height ?? defaultHeight) + (width ?? defaultWidth)) / 2) / 2;
    }
    return radius ?? circularRadius ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final Color fBgColor = bgColor ?? Colors.grey.withValues(alpha: .15);
    return Container(
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getRadius()),
        color: fBgColor,
        boxShadow: shadows
      ),
      child: Center(child: buildCenterWidget()),
    );
  }

  Widget buildCenterWidget() {
    final textWidget = Text(text ?? "", style: style);
    if (imagePath != null) {
      final List<Widget> widgets = [];
      if (imagePath != null) {
        widgets.add(Image.asset(imagePath!, width: 30));
      }
      if (text != null) {
        widgets.add(textWidget);
      }

      return Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets,
      );
    }
    return text != null ? textWidget : SizedBox();
  }
}
