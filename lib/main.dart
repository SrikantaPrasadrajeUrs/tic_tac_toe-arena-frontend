import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/theme/app_theme.dart';
import 'package:tic_tac_toe/features/app/presentation/bloc/theme/theme_bloc.dart';
import 'package:tic_tac_toe/features/app/presentation/pages/welcome.dart';


void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: state.themeMode,
            home: Welcome()
        );
      },
    );
  }
}
