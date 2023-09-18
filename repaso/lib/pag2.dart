import 'dart:math';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.callback});
  
  final Function(String) callback;
  @override
  State<Page2> createState() => _Page2State();
  

}

class _Page2State extends State<Page2> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        backgroundColor: Colors.blue
      ),
      body:  Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
          colors: [Color.fromARGB(255, 79, 183, 231), Color.fromARGB(255, 206, 230, 241)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const Text('Genere número random', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 25),),
              Text(number, style: const TextStyle(fontSize:30, color: Colors.red, fontWeight: FontWeight.bold),),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    number = Random().nextInt(1000).toString();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0), 
                  )
                ),
                child: const Text('Generar'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.callback(number);
                  });
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0), 
                    )
                    ),
                child: const Text('Guardar'),
              ),
            ]
          )
        )
      ),  
    );
  }
}