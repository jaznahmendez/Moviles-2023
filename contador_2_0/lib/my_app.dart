import 'package:flutter/material.dart';
import 'Screens/primos.dart';
import 'Screens/multi.dart';
import 'Screens/suma.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const SumRest(),
    const Mult(),
    const Primos()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(widget.title)),
        ),
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Suma'),
            BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Multiplica'),
            BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Primo')
          ],
        ));
  }
}
