import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/constants/storage_keys.dart';
import 'package:tic_tac_toe/core/storage/shared_prefs_storage.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPrefsStorage prefs;
  ThemeBloc(this.prefs) : super(ThemeState(ThemeMode.dark)) {
    on<ToggleThemeEvent>(handleToggleTheme);
    on<InitialThemeEvent>(handleInitialThemeEvent);
  }

  Future<void> handleToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit)async{
    final newMode = state.themeMode == ThemeMode.dark? ThemeMode.light: ThemeMode.dark;
    emit(ThemeState(newMode));
    prefs.setString(StorageKeys.themeMode, newMode.name);
  }

  Future<void> handleInitialThemeEvent(InitialThemeEvent event, Emitter<ThemeState> emit)async{
    ThemeMode newMode = ThemeMode.dark;
    final storedThemeMode = prefs.getString(StorageKeys.themeMode);
    if(storedThemeMode!=null) newMode = storedThemeMode == ThemeMode.dark.name? ThemeMode.dark: ThemeMode.light;
    prefs.setString(StorageKeys.themeMode, newMode.name);
    emit(ThemeState(newMode));
  }
}
