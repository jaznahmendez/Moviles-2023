import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tip Time'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _amount = 0.0;
  bool _round = false;
  double? _radioValue = 1;
  String _tip = '';

  void _changeAmount(String value) {
    setState(() {
      _amount = double.tryParse(value) ?? 0.0;
    });
  }

  void _changeValue(double? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _changeSwitchValue(bool value) {
    setState(() {
      _round = value;
    });
  }

  void _calculateTip() {
  double tip = _amount * _radioValue!;
  if (_round) {
    setState(() {
      _tip = 'Tip Amount: \$${tip.ceil()}';
    });
  } else {
    setState(() {
      _tip = 'Tip Amount: \$${tip.toStringAsFixed(2)}';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Time'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child:
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(Icons.store_sharp, color: Theme.of(context).primaryColor)),                  
                        SizedBox(
                          width: 200,
                          child:
                            TextField(
                              keyboardType: TextInputType.number,
                              onChanged: _changeAmount,
                              decoration: const InputDecoration(
                              labelText: 'Cost of Service',
                              border: OutlineInputBorder(),
                            ),
                            ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.rate_review, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      const Text(
                        'How was the service?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1.2,
                                groupValue: _radioValue,
                                onChanged: _changeValue,
                              ),
                              const Text('Amazing(20%)'),
                            ]
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1.18,
                                groupValue: _radioValue,
                                onChanged: _changeValue,
                              ),
                              const Text('Good(18%)'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1.15,
                                groupValue: _radioValue,
                                onChanged: _changeValue,
                              ),
                              const Text('Okay(15%)'),
                            ],
                          ),
                  ],
                      ),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Icon(Icons.trending_up, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      const Text(
                        'Round up tip?',
                        style: TextStyle(fontSize: 18),
                      ),
                      Expanded(child: Container()),
                      Switch(
                        value: _round,
                        onChanged: _changeSwitchValue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _calculateTip,
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).cardColor // Change this color to the desired one
                      ),
                      child: const Text('CALCULATE'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_tip),
                    ],
                  ),
                ],
              ),
          ),
        ),
      );
  }
}
