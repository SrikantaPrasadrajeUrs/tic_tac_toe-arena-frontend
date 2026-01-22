import 'package:flutter/material.dart';

class Navigation{
  static void navigateTo({required BuildContext context, required Widget target}){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>target));
  }
}