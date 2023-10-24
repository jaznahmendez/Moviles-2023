import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio/pages/navigation.dart';
import 'package:desafio/theme/bloc/theme_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Desafio 4 App',
          theme: state.themeData,
          home: const Nav(),
        );
      },
    );
  }
}