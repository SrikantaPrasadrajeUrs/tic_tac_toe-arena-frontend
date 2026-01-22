import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/widgets/build_btn.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColorExtension>()!;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login to Your Account"),
            Text("Access your account to manage settings,"),
            Text("explore features"),
            Text("Email"),
            TextFormField(
            ),
            Text("Password"),
            TextFormField(),
            BuildBtn(text: "Login", bgColor: appColors.bgBtnColor, imagePath: "assets/images/google.png")
          ],
        ),
      ),
    );
  }
}