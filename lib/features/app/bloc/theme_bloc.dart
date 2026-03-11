
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';
part 'theme_event.dart';

///
/// on
/// emit
///

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
  ThemeBloc():super(ThemeState(ThemeMode.dark)){
   on<ToggleThemeEvent>(handleToggleTheme);
  }

  Future<void> handleToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit)async{
    final newMode = state.themeMode == ThemeMode.dark? ThemeMode.light: ThemeMode.dark;
    emit(ThemeState(newMode));
  }
}