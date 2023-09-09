import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String image;
  final String text;
  final int numDay;

  ItemActividad({super.key, required this.image, required this.text, required this.numDay});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Day $numDay", style: TextStyle(fontSize: 11)),
          Text(text),
        ],
      ),
    );
  }
}