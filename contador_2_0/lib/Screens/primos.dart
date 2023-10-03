import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counter.dart';

class Primos extends StatefulWidget {
  const Primos({Key? key}) : super(key: key);

  @override
  State<Primos> createState() => _PrimosState();
}

class _PrimosState extends State<Primos> {
  
  @override
  void initState() {
    context.read<CounterProvider>().esPrimo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              context.watch<CounterProvider>().counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.watch<CounterProvider>().primo,
                style: TextStyle(color: context.watch<CounterProvider>().color, fontSize: 30),)
              ]
            ),
          ),
        ],
      ),
    );
  }
}
