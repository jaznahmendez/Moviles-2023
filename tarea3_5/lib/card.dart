import 'package:flutter/material.dart';
import 'package:tarea3_5/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;
  const RecipeCard({super.key, required this.recipe});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePage(recipe: recipe),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${recipe["image"]}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: 180,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('${recipe["name"]}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.schedule, size: 15,),
                              Text(' ${recipe["cook_time"]}', style: const TextStyle(fontWeight: FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.work, size: 15,),
                              Text(' ${recipe["complexity"]}', style: const TextStyle(fontWeight: FontWeight.w300))
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.attach_money, size: 15,),
                              Text(' ${recipe["cost"]}', style: const TextStyle(fontWeight: FontWeight.w300))
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}