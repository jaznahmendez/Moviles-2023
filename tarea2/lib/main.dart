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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ITESO APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {

      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child:
                Image.network('https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            'El ITESO, Univerisdad Jesuita de Guadalajara',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text("San Pedro Tlaquepaque, Jal.",
                            style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11), )
                          ],
                        )
                    ),
                    Row(
                      children: [
                        Boton(icon: Icons.thumb_up_sharp, size: 25, function: _incrementCounter),
                        Boton(icon: Icons.thumb_down_sharp, size: 25, function: _decrementCounter),
                        Text('$_counter'),
                      ],
                    )
                  ]    
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Boton(icon: Icons.email, size: 48, name: "Cualquier duda al correo: admision@iteso.mx"),
                        Text("Correo"),
                      ],
                    ),
                    Column(
                      children: [
                        Boton(icon: Icons.call, size: 48, name: "El número de contacto es 33 3669 3434"),
                        Text("Llamada"),
                      ],
                    ),
                    Column(
                      children: [
                        Boton(icon: Icons.directions, size: 48, name: "Se encuentra ubicado en Periférico Sur 8585"),
                        Text("Ruta"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara''', 
                    textAlign: TextAlign.justify,),
                ),
              ]
            ),
          ]
        ),
      )
    );
  }
}

class Boton extends StatefulWidget {
  final IconData icon;
  final double size;
  final String? name;
  final Function? function;
  const Boton({super.key, required this.size, required this.icon, this.name, this.function});

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
          size: widget.size,
        ),
        onPressed: () {
          setState(() {
            iconColor = iconColor == Colors.black ? Colors.indigo : Colors.black;
          });

          if(widget.function == null){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text(widget.name!),
            ),
            
            );
          }else{
            widget.function!();
          }
          
        },
      );
  }
}