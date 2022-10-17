import 'package:flutter/material.dart';
import 'package:flutter_hw/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyHomePage(title: 'Tinder. Chuck Norris'),
    );
  }
}
