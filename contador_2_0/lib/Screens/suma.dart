import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counter.dart';

class SumRest extends StatefulWidget {
  const SumRest({Key? key}) : super(key: key);

  @override
  State<SumRest> createState() => _SumRestState();
}

class _SumRestState extends State<SumRest> {
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
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Expanded(child: Container()),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().resetCounter();
                  },
                  tooltip: 'Restart',
                  child: const Icon(Icons.refresh),
                ),
                Expanded(child: Container()),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterProvider>().incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
