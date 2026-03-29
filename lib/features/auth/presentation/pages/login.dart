import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/theme/app_shadow_extension.dart';
import 'package:tic_tac_toe/core/validation/validation.dart';
import 'package:tic_tac_toe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tic_tac_toe/features/auth/presentation/pages/register.dart';
import 'package:tic_tac_toe/features/auth/presentation/widgets/footer.dart';
import '../../../../core/utils/app_navigation/navigation.dart';
import '../../../../core/widgets/build_btn.dart';
import '../../data/datasources/auth_remote_ds.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repositoories/auth_repository.dart';
import '../../domain/usecases/register_email_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

  void navigateToRegister() {
    Navigation.navigateTo(
      context: context,
      target: BlocProvider.value(
        value: context.read<AuthBloc>(),
        child: const Register(),
      ),
    );
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
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigation.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is AuthSuccess) {
              // Navigate to Home or Game screen
            }
          },
          child: Column(
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login to Your Account",
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Access your account to manage settings,",
                          style: textTheme.bodyMedium,
                        ),
                        Text("explore features", style: textTheme.bodyMedium),
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
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return BuildBtn(
                              text: "Login",
                              bgColor: Colors.redAccent,
                              callback: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    EmailPasswordLoginEvent(
                                      _emailController.text,
                                      _passwordController.text,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
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
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Expanded(child: Divider(thickness: 2, endIndent: 10)),
                Text("OR"),
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
            Footer(
              onRightTextClick: navigateToRegister,
              landingTextLeft: "Don't have an Account?",
              landingTextRight: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
