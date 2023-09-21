import 'package:flutter/material.dart';
import 'package:tarea3_5/favorite.dart';

class RecipePage extends StatelessWidget {
  final Map<String, dynamic> recipe;
  const RecipePage({super.key, required this.recipe});
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('${recipe["name"]}', style: const TextStyle(fontWeight: FontWeight.w400)),
        actions: const [
          Boton()
        ]
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  '${recipe["image"]}',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 25, color: Color.fromRGBO(230, 184, 160, 1), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipe["ingredients"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5), 
                      child: Text(
                        recipe["ingredients"][index],
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                ),
                const SizedBox(height: 15),
                const Text(
                  'Steps',
                  style: TextStyle(fontSize: 25, color: Color.fromRGBO(230, 184, 160, 1), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipe["steps"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        recipe["steps"][index],
                        style: const TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}