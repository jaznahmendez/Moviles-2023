import 'package:flutter/material.dart';
import 'package:tarea3_5/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 3.5',
      theme: ThemeData.dark(),
      home: const Home(), 
    );
  }
}
