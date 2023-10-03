import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counter.dart';

class Mult extends StatefulWidget {
  const Mult({Key? key}) : super(key: key);

  @override
  State<Mult> createState() => _MultState();
}

class _MultState extends State<Mult> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 20, 0, 0),
                child: SizedBox(
                  width: 120,
                  child: Text(
                    context.watch<CounterProvider>().counter.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {
                  context.read<CounterProvider>().xDos();
                  context.read<CounterProvider>().showSnackBar(context, 'Multiplicar x2');
                },
                child: const Text('Multiplicar x2'),
              ),
              const SizedBox(height: 16), 
              OutlinedButton(
                onPressed: () {
                  context.read<CounterProvider>().xTres();
                  context.read<CounterProvider>().showSnackBar(context, 'Multiplicar x3');
                },
                child: const Text('Multiplicar x3'),
              ),
              const SizedBox(height: 16), 
              OutlinedButton(
                onPressed: () {
                  context.read<CounterProvider>().xCinco();
                  context.read<CounterProvider>().showSnackBar(context, 'Multiplicar x5');
                },
                child: const Text('Multiplicar x5'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
