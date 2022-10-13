import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hw/components/card.dart';
import 'package:flutter_hw/components/buttons.dart';
import 'package:flutter_hw/pages/MyHomePage.dart';


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
      theme: ThemeData(
          primarySwatch: Colors.teal, backgroundColor: Colors.teal.shade800),
      home: const MyHomePage(title: 'Tinder. Chuck Norris'),
    );
  }
}