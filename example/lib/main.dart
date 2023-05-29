import 'package:flutter/material.dart';
import 'package:life_peak_lib/life_peak_lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  processTestStruct();
                },
                child: const Text('processTestStruct'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  processTestArray();
                },
                child: const Text('processTestArray'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
