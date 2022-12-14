import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0){
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_counter % 2 != 0)
                const Text(
                    'GANJIL',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    )
                ),

              if (_counter % 2 == 0)
                const Text(
                    'GENAP',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    )
                ),

              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: (_counter != 0)? true : false,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: (_counter != 0) ? _decrementCounter : null,
                    tooltip: 'Decrement',
                    backgroundColor: (_counter != 0) ? Colors.blue : Colors.grey,
                    child: const Icon(Icons.remove),
                  ),
                ),
              ),



              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              )
            ],
          ),
        )
    );
  }
}