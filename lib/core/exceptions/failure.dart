import 'package:flutter/cupertino.dart';

abstract class Failure{
  final String message;
  Failure(this.message);
}

class AuthFailure extends Failure {
  AuthFailure(super.message);
}