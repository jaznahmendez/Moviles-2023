import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:provider/provider.dart';
import 'Providers/counter.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (_)=> CounterProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter 2.0',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter 2.0'),
    );
  }
}

