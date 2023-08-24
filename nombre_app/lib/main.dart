import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //La clase debe retornar algo! En este caso un Widget de tipo MaterialApp
      title: 'Widgets Mas utilizados', //Un atributo de MaterialApp es el titulo de tu app 
      theme: ThemeData( //Otro atributo es theme, nos ayuda a darle color y personalización de estilo a tu app que puedes utilizar en cualquier lugar
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 109, 197, 219)), //Color principal de mi app
        useMaterial3: true, // Utilizamos Material Design
      ),
      home: const Birthday(), //Otro atributo de Material App, es la pantalla home , en este caso le paso otra clase, la clase "BirthdayCard"
    );
  }
}

class Birthday extends StatelessWidget {
  const Birthday ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Happy Birthday'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Happy Birthday :)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'https://hips.hearstapps.com/hmg-prod/images/birthday-cake-with-happy-birthday-banner-royalty-free-image-1656616811.jpg?crop=0.668xw:1.00xh;0.0255xw,0&resize=980:*' // Ruta de la imagen en tu proyecto
            ),
          ],
        ),
      ),
    );
  }
}