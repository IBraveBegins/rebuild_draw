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
      title: '小颗粒度方式：优化频繁build绘制问题',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '小颗粒度方式：优化频繁build绘制问题'),
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
  int _counter = 0;

  get _counterWidget => [
        Text("count:$_counter"),
        ElevatedButton(
            child: const Text('添加'),
            onPressed: () {
              setState(() {
                _counter++;
              });
            })
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[..._counterWidget, OtherWidget()],//未优化
          children: <Widget>[CounterWidget(), OtherWidget()], //优化
        ),
      ),
    );
  }
}

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("OtherWidget build");
    return const Text("OtherWidget");
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("count:$_counter"),
        ElevatedButton(
            child: const Text('添加'),
            onPressed: () {
              setState(() {
                _counter++;
              });
            })
      ],
    );
  }
}
