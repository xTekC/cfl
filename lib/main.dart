import 'package:flutter/material.dart';
import 'native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Call C from Dart')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              helloFromC(); // Call the C function
            },
            child: const Text('Call C'),
          ),
        ),
      ),
    );
  }
}
