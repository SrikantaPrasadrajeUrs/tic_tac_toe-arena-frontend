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

  void navigateToLogin() => Navigation.navigateTo(context: context, target: Placeholder());

  void togglePasswordVisibility() => setState(() => _obscurePassword = !_obscurePassword);

  void toggleRememberMe(bool? value) => setState(() => _rememberMe = !_rememberMe);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shadows = theme.extension<AppShadowExtension>()!;
    final textTheme = theme.textTheme;
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: ()=>Navigation.pop(context), icon: Icon(Icons.arrow_back_ios)),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    10,
                    16,
                    MediaQuery.of(context).viewInsets.bottom,
                  ),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login to Your Account",
                            style: textTheme.headlineMedium),

                        const SizedBox(height: 10),

                        Text(
                          "Access your account to manage settings,",
                          style: textTheme.bodyMedium,
                        ),
                        Text(
                          "explore features",
                          style: textTheme.bodyMedium,
                        ),

                        const SizedBox(height: 30),

                        Text("Email", style: textTheme.labelSmall),
                        const SizedBox(height: 3),
                        TextFormField(
                          controller: _emailController,
                          validator: Validation.email,
                        ),

                        const SizedBox(height: 10),

                        Text("Password", style: textTheme.labelSmall),
                        const SizedBox(height: 3),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          validator: Validation.password,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: togglePasswordVisibility,
                              icon: _obscurePassword
                                  ? const Icon(CupertinoIcons.eye_slash_fill)
                                  : const Icon(CupertinoIcons.eye_fill),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        BuildBtn(text: "Login", bgColor: Colors.redAccent),

                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: toggleRememberMe,
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                            ),
                            const Text("Remember me"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Bottom Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 2, endIndent: 10)),
                          const Text("OR"),
                          Expanded(child: Divider(indent: 10, thickness: 2)),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Row(
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

                      const SizedBox(height: 15),
                      Spacer(),
                      Footer(
                        onRightTextClick: navigateToLogin,
                        landingTextLeft: "Don't have an Account?",
                        landingTextRight: "Register",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
