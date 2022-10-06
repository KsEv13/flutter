import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hw/components/joke_module.dart';

import '../components/button.dart';
import '../components/card.dart';
import 'package:http/http.dart' as http;
import '../components/joke_module.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _joke = "To get a new joke tap like or dislike!";

  void _updateJoke() {
    setState(() {
      http.get(Uri.parse("https://api.chucknorris.io/jokes/random"))
          .then((resp) => {_joke = Instruction.fromJson(jsonDecode(resp.body)).value});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                JokeText(text: _joke),
              ],
            ),
          ),
          bottomSheet: Buttons(like: _updateJoke, dislike: _updateJoke),
        ));
  }
}