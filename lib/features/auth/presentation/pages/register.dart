import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/widets/build_btn.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<AppColorExtension>()!;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login to Your Account"),
            Text("Access your account to manage settings,"),
            Text("explore features"),
            Text("Email"),
            TextFormField(),
            Text("Password"),
            TextFormField(),
            BuildBtn(text: "Login", bgColor: colorExtension.bgBtnRedColor),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildBtn(imagePath: "assets/images/google.png" ,bgColor: colorExtension.greySurfaceLow, requireCircularBtn: true, height: 60, width: 60,),
                BuildBtn(imagePath: "assets/images/facebook.png",  bgColor: colorExtension.greySurfaceLow, requireCircularBtn: true, height: 60, width: 60,),
                BuildBtn(imagePath: "assets/images/apple.png",  bgColor: colorExtension.greySurfaceLow, requireCircularBtn: true, height: 60, width: 60,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
