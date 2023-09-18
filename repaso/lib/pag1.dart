import 'package:flutter/material.dart';
import 'package:repaso/pag2.dart';
import 'package:repaso/pag3.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});
  
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  String text1 = '';
  String text2 = '';
  String str = '';
  String number = '';

  void _pag2() async {
    showDialog(context: context,
      builder: (BuildContext context) => 
        AlertDialog(
          title: const Text('Ingrese Datos'),
          content: TextField(
            onChanged: (String value) {
              setState(() {
                str = value;
              });
            },
            decoration: const InputDecoration(hintText: "Ingrese palabra"),
            maxLength: 10
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context) ,
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: (){
                setState(() => text1 = str,);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(
                      callback: (value){
                        setState(() => number = value,);
                      },
                    )
                  )
                );
              } ,
              child: const Text('Aceptar')
            ),
          ],
        ));
  }

  void _pag3() async{
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Page3(
          callback: (value){
            setState(() => text2 = value,);
          },
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 1'),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('BIENVENIDOS', style: TextStyle(fontFamily: 'Pacifico', fontSize: 40, color: Colors.grey),),
            Image.asset(
              'assets/images/1.png',
              fit: BoxFit.cover,
            ),
            const Text('Seleccione la accion a realizar:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), 
                    )
                  ),
                  onPressed: _pag2,
                  child: const Text('Pagina 2')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0), 
                    )
                  ),
                  onPressed: _pag3,
                  child: const Text('Pagina 3')),
              ],
            ),
            Text('Pag2=> $text1 $number'),
            Text('Pag3=> $text2')
          
          ]),
      ),
    );
  }
}