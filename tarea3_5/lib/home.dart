import 'package:flutter/material.dart';
import 'package:tarea3_5/card.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List _recipes = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/recipes/recipes.json');
    final data = await json.decode(response);
    setState(() {
      _recipes = data["recipes"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick & Easy', style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(32, 26, 24, 0),
      ),
      body: Center(
        child:  ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return RecipeCard(recipe: _recipes[index]);
          },
        ),
      ),
    );
  }


}