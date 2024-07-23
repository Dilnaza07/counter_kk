import 'package:counter_kk/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterNotifier(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final notifier = context.read<CounterNotifier>();

    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        backgroundColor: Colors.indigo[500],
        title: Text(
          'Counter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Tab"-"to decrement',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.indigo[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: notifier.decrement,
                ),
                CounterText(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: notifier.increment,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Tab"+"to increment',
            style: TextStyle(color: Colors.white),
          ),
        ]),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterNotifier>().counter;
    return Text(
      '$counter',
    );
  }
}
