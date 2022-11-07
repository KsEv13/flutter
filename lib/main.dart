import 'package:flutter/material.dart';
import 'package:flutter_hw/pages/favourite.dart';
import 'package:flutter_hw/pages/my_home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'internet_not_connected.dart';


Future <void> main() async {
  await Hive.initFlutter();
      runApp(MaterialApp(
        initialRoute: '/',
        routes: {
          '/':(BuildContext context) => const MyApp(),
          '/favourite':(BuildContext context) => const Favourites()
        }
    ));
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
