import 'package:flutter/material.dart';

class Boton extends StatefulWidget {
  const Boton({super.key});

  @override
  _BotonState createState() => _BotonState();
}

class _BotonState extends State<Boton> { 
  IconData nameIcon = Icons.star_border_outlined;

  @override
  Widget build(BuildContext context) {
    return 
      IconButton(
        icon: Icon(
          nameIcon,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          setState(() {
            nameIcon = nameIcon == Icons.star_border_outlined ? Icons.star : Icons.star_border_outlined;
          });

          
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if(nameIcon == Icons.star){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Recipe added to favourites :)'),
              ),
            );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Recipe removed from favourites :('),
              ),
            );
          }
          
        },
      );
  }
}