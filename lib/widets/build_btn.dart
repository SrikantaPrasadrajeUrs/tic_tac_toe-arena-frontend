import 'package:flutter/material.dart';

class BuildBtn extends StatelessWidget {
  final Color? bgColor;
  final String? text;
  final TextStyle? style;
  final String? imagePath;
  final double height;
  final double width;
  final bool requireCircularBtn;

  const BuildBtn({
    super.key,
    this.text,
    this.imagePath,
    this.bgColor,
    this.style,
    this.width = double.infinity,
    this.height = 60,
    this.requireCircularBtn = false,
  });

  double getBorderRadius() {
    return requireCircularBtn ? ((height + width) / 2) / 2 : 30;
  }

  @override
  Widget build(BuildContext context) {
    final Color fBgColor = bgColor ?? Colors.grey.withValues(alpha: .15);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getBorderRadius()),
        color: fBgColor,
      ),
      child: Center(child: buildCenterWidget()),
    );
  }

  // only image
  // only text
  // both text and image
  Widget buildCenterWidget() {
    final textWidth = Text(text ?? "");
    if (imagePath != null) {
      List<Widget> widgets = [Image.asset(imagePath!, width: 30)];
      if (text != null) widgets.add(textWidth);
      return Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets,
      );
    }
    return text != null ? textWidth : SizedBox();
  }
}
