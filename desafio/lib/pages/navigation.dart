import 'package:flutter/material.dart';
import 'package:desafio/pages/explore.dart';
import 'package:desafio/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio/pages/home.dart';
import 'package:desafio/theme/bloc/theme_bloc.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    const HomePage(),
    ExplorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },  
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Explore',
          ),
        ],
        ),
      );
  }
}