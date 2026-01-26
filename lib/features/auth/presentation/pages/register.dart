import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/widgets/build_btn.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorExtension>()!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login to Your Account", style: textTheme.headlineMedium),
                SizedBox(height: 10),
                Text(
                  "Access your account to manage settings,",
                  style: textTheme.bodyMedium,
                ),
                Text("explore features", style: textTheme.bodyMedium),
                SizedBox(height: 30),
                Text("Email", style: textTheme.labelSmall),
                TextFormField(),
                SizedBox(height: 10),
                Text("Password", style: textTheme.labelSmall),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.eye_fill),
                  ),
                ),
                SizedBox(height: 10),
                BuildBtn(text: "Register", bgColor: Colors.redAccent),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text("Remember me"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Divider(thickness: 2, endIndent: 10)),
                Text("OR"),
                Expanded(child: Divider(indent: 10, thickness: 2)),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                BuildBtn(
                  text: "Sign up with google",
                  imagePath: "assets/images/google.png",
                  style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                BuildBtn(
                  text: "Sign up with google",
                  imagePath: "assets/images/apple.png",
                  style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Already have an account?", style: textTheme.bodySmall!.copyWith(color: appColors.neutralGrey, fontWeight: FontWeight.bold, fontSize: 13)),
                      TextSpan(text: " Sign in", style: textTheme.bodySmall!.copyWith(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 13) ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
