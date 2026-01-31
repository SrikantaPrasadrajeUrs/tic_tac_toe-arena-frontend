import 'package:flutter/material.dart';

class Navigation{
  static Future navigateTo({required BuildContext context, required Widget target})async{
    return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>target));
  }

  static void pop(BuildContext context){
    Navigator.of(context).pop();
  }
}