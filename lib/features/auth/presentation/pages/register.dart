import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_shadow_extension.dart';
import 'package:tic_tac_toe/core/validation/validation.dart';
import 'package:tic_tac_toe/features/auth/presentation/widgets/footer.dart';
import '../../../../core/utils/app_navigation/navigation.dart';
import '../../../../core/widgets/build_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigateToLogin() {
    Navigation.navigateTo(context: context, target: Placeholder());
  }

  void togglePasswordVisibility() =>
      setState(() => _obscurePassword = !_obscurePassword);

  void toggleRememberMe(bool? value) =>
      setState(() => _rememberMe = !_rememberMe);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadows = theme.extension<AppShadowExtension>()!;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigation.pop(context), icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
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
                  TextFormField(controller: _emailController, validator: Validation.email,),
                  SizedBox(height: 10),
                  Text("Password", style: textTheme.labelSmall),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    validator: Validation.password,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: _obscurePassword
                            ? Icon(CupertinoIcons.eye_slash_fill)
                            : Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BuildBtn(text: "Register", bgColor: Colors.redAccent),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: toggleRememberMe,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                ],
              ),
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
                  shadows: shadows.low,
                ),
                BuildBtn(
                  height: 60,
                  width: 60,
                  requireCircularRadius: true,
                  imagePath: "assets/images/facebook.png",
                  shadows: shadows.low,
                ),
                BuildBtn(
                  height: 60,
                  width: 60,
                  requireCircularRadius: true,
                  imagePath: "assets/images/apple.png",
                  shadows: shadows.low,
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
