import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.dark)) {
    on<ToggleThemeEvent>((event, emit) {
      final newMode = state.themeMode == ThemeMode.dark? ThemeMode.light: ThemeMode.dark;
      emit(ThemeState(newMode));
    });
  }
}
