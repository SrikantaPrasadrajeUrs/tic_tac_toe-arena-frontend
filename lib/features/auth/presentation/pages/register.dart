import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/auth/presentation/widgets/footer.dart';
import 'package:tic_tac_toe/utils/navigation.dart';
import 'package:tic_tac_toe/widgets/build_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  void navigateToLogin() {
    Navigation.navigateTo(context: context, target: Placeholder());
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildBtn(
                  height: 60,
                  width: 60,
                  requireCircularRadius: true,
                  imagePath: "assets/images/google.png",
                ),
                BuildBtn(
                  height: 60,
                  width: 60,
                  requireCircularRadius: true,
                  imagePath: "assets/images/facebook.png",
                ),
                BuildBtn(
                  height: 60,
                  width: 60,
                  requireCircularRadius: true,
                  imagePath: "assets/images/apple.png",
                ),
              ],
            ),
            Footer(
              onRightTextClick: navigateToLogin,
              landingTextLeft: "Already have an Account?",
              landingTextRight: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
