import 'package:flutter/material.dart';
import 'info_lugar.dart';
import 'item_actividad.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> imagePaths = [
      'assets/images/candidasa-beach.jpg',
      'assets/images/canggu-beach.jpg',
      'assets/images/jimbaran-beach.jpg',
      'assets/images/kuta_beach.jpg',
      'assets/images/legian-beach.jpg',
      'assets/images/nusa-dua-beach.jpg',
      'assets/images/sanur-beach.jpg',
      'assets/images/seminyak-beach.jpg',
      'assets/images/tanjung-benoa-beach.jpg',
      'assets/images/uluwatu.jpg'
    ];

    List<String> imageText = [
      'Candidasa Beach',
      'Canggu Beach',
      'Jimbaran Beach',
      'Kuta Beach',
      'Legian Beach',
      'Nusa Dua Beach',
      'Sanur Beach',
      'Seminayak Beach',
      'Tanjung Benoa Beach',
      'Uluwatu'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/main-bali.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 130,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                          child: const Text("Details"),
                        ),
                        const Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(image: imagePaths[index], text: imageText[index], numDay: index + 1);
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Reservación en Progreso"),
                          ),
                        );
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Adjust the radius for rounded corners
                      ),
                      child: const Text("Start booking", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}