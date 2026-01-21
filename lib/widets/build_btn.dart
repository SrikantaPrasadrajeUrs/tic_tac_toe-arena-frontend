import 'package:flutter/material.dart';

class BuildBtn extends StatelessWidget {
  final Color? bgColor;
  final String text;
  final TextStyle? style;
  final String? imagePath;

  const BuildBtn({
    super.key,
    required this.text,
    this.imagePath,
    this.bgColor,
    this.style,
  });



  @override
  Widget build(BuildContext context) {
    final Color fBgColor = bgColor ?? Colors.grey.withValues(alpha: .15);
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: fBgColor
      ),
      child: Center(child: buildCenterWidget()),
    );
  }

  Widget buildCenterWidget(){
    if(imagePath!=null){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath!, width: 25),
          SizedBox(width: 20),
          Text(text),
        ],
      );
    }
    return Text(text);
  }
}
