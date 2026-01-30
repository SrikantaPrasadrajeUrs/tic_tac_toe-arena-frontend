import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_color_extension.dart';
import 'package:tic_tac_toe/widets/build_btn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();

  // Form, GlobalKey

  // validate email
  String? validateEmail(String? value){
    if(value==null||value.trim().isEmpty){
      return "Email is required";
    }
    return null;
  }

  // Uppercase, lowerCase symbol, 8

  String? validatePassword(String? value){
    if(value==null||value.trim().isEmpty){
      return "Password is required";
    }
    if(value.length<8){
      return "Minimum 8 characters are required";
    }

    if(!value.contains(RegExp(r'[A-Z]'))){
      return "1 Uppercase is required";
    }

    if(!value.contains(RegExp(r'[a-z]'))){
      return "1 Lowercase is required";
    }

    if(!value.contains(RegExp(r'[0-9]'))){
      return "Number is required";
    }
    return null;
  }


  // validate password

  // ValueKey, ObjectKey, UniqueKey, GlobalKey

  @override
  Widget build(BuildContext context) {
    final colorExtension = Theme.of(context).extension<AppColorExtension>()!;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 10),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login to Your Account"),
              Text("Access your account to manage settings,"),
              Text("explore features"),
              Text("Email"),
              // email
              TextFormField(
                validator: validateEmail,
              ),
              Text("Password"),
              // password
              TextFormField(
                validator: validatePassword,
              ),
              GestureDetector(
                  onTap: (){
                    _formKey.currentState!.validate();
                  },
                  child: BuildBtn(text: "Login", bgColor: colorExtension.bgBtnRedColor)),
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
      ),
    );
  }
}
