
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
  ThemeBloc(super.initialState);
}