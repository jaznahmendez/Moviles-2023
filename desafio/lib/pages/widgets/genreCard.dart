import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final Map<String, dynamic> genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            genre["img"], // Replace with your image URL
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Text(
              genre["name"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
