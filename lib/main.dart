import 'package:flutter/material.dart';
import 'package:funcionapls/screen/calculadora.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
    );
  }
}
