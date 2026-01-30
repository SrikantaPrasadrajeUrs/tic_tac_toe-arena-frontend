import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_color_extension.dart';

class Footer extends StatefulWidget {
  final String landingTextLeft;
  final String landingTextRight;
  final VoidCallback onRightTextClick;
  const Footer({
    super.key,
    required this.onRightTextClick,
    required this.landingTextLeft,
    required this.landingTextRight,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late final TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = widget.onRightTextClick;
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorExtension>()!;
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      key: ValueKey(widget.landingTextLeft + widget.landingTextRight),
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.landingTextLeft,
            style: textTheme.bodySmall!.copyWith(
              color: appColors.neutralGrey,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: " ${widget.landingTextRight}",
            recognizer: tapGestureRecognizer,
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
