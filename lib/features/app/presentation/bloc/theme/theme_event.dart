part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class InitialThemeEvent extends ThemeEvent{}

class ToggleThemeEvent extends ThemeEvent{}

