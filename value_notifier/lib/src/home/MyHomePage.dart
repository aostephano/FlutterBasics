import 'package:flutter/material.dart';
import 'package:value_notifier/src/home/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterInstance = Counter();

  // @override
  // void initState() {
  //   super.initState();
  //   counter.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              valueListenable: counterInstance,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            )
            // AnimatedBuilder(
            //   animation: counter,
            //   builder: (context, child) {
            //     return Text(
            //       '${counter.value}',
            //       style: Theme.of(context).textTheme.headlineLarge,
            //     );
            //   },
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterInstance.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
