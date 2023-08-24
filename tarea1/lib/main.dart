import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const McFlutter(),
    );
  }
}

class McFlutter extends StatelessWidget {
  const McFlutter ({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Mc Flutter', style: TextStyle(color: Colors.white),),
      ),
      body: const Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: BoxContainer(),
          ),
    )
    );
  }
}

class BoxContainer extends StatelessWidget {
  const BoxContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        )
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 50.0,
                ),]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [        
                  SizedBox( height: 30,
                  child:    
                    Text(
                    'Flutter McFlutter',
                    style: TextStyle(fontSize: 25),
                    ) ,
                  ),
                  Text(
                  'Experienced App Developer',
                  style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                  '123 Main Street',
                  style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                  '(415) 555-0198',
                  style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Boton(icon: Icons.accessibility, name: 'Accessibility'),
                ]
              ), 
              Column(
                children: [
                 Boton(icon: Icons.timer, name: 'Timer'),

                ]
              ), 
              Column(
                children: [
                  Boton(icon: Icons.phone_android, name: 'Android Phone')
                ]
              ),
              Column(
                children: [
                  Boton(icon: Icons.phone_iphone, name: 'Iphone Phone'),
                ]
              )
            ],
          )
      ]),       
  );
} 
}

class Boton extends StatefulWidget {
  final IconData icon;
  final String name;
  const Boton({super.key, required this.icon, required this.name});

  @override
  _BotonState createState() => _BotonState();

}

class _BotonState extends State<Boton> { 
  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return 
      IconButton(
        icon: Icon(
          widget.icon,
          color: iconColor,
        ),
        onPressed: () {
          setState(() {
            iconColor = iconColor == Colors.black ? Colors.indigo : Colors.black;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text('Button: ${widget.name}'),
            duration: const Duration(seconds: 0, milliseconds: 300),
            ),
            
          );
        },
      );
  }
}