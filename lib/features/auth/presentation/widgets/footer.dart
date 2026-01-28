import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_color_extension.dart';

class Footer extends StatelessWidget {
  final String landingTextLeft;
  final String landingTextRight;
  final VoidCallback onRightTextClick;
  const Footer({super.key, required this.onRightTextClick, required this.landingTextLeft, required this.landingTextRight});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorExtension>()!;
    final textTheme = Theme.of(context).textTheme;
    final gestureRecognizer = TapGestureRecognizer();
    gestureRecognizer.onTap = onRightTextClick;
    return RichText(
      key: ValueKey(landingTextLeft+landingTextRight),
      text: TextSpan(
        children: [
          TextSpan(
            text: landingTextLeft,
            style: textTheme.bodySmall!.copyWith(
              color: appColors.neutralGrey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: " $landingTextRight",
            recognizer: gestureRecognizer,
            style: textTheme.bodySmall!.copyWith(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
