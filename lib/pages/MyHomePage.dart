import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hw/components/joke_module.dart';

import '../components/buttons.dart';
import '../components/card.dart';
import 'package:http/http.dart' as http;

import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards/draggable_card.dart';

import 'package:url_launcher/url_launcher.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _joke = "The Foo Fighters will soon find Chuck Norris had already fought and killed all the Foo.";
  var _link = "https://api.chucknorris.io/jokes/P-QDqAR2T4eLXfSidSOUsw";
  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _updateJoke() {
    setState(() {
      var jokeObj = http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
      jokeObj.then((resp) => {_joke = Instruction.fromJson(jsonDecode(resp.body)).value});
      jokeObj.then((resp) => {_link = Instruction.fromJson(jsonDecode(resp.body)).url!});
    });
  }


  @override
  void initState() {
    while (true) {
      _swipeItems.add(SwipeItem(
          content: _joke,
          likeAction: () {
            _updateJoke();
          },
          nopeAction: () {
            _updateJoke();
          },
          onSlideUpdate: (SlideRegion? region) async {}
      ));

      _matchEngine = MatchEngine(swipeItems: _swipeItems);
      super.initState();
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
          ),
          drawer: Drawer(
          // ListView ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                  child: Text('Menu'),
                ),
                ListTile(
                  title: const Text('Launch this quote in Web'),
                  onTap: () {
                    _launchURL(_link);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Column(children: [
            SizedBox(
              height: 550,
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          JokeText(text: _joke), //swipeItems[index].content.text
                        ],
                      ),
                    ),
                  );
                },
                onStackFinished: () {},
                itemChanged: (SwipeItem item, int index) {
                },
                fillSpace: true,
              ),
            ),

          ]),
          bottomSheet: Buttons(like: _updateJoke, dislike: _updateJoke),
        ));
  }

  Widget cardView() {
    return Center(
      child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height / 1.5 - 100,
          width: MediaQuery
              .of(context)
              .size
              .width / 1.5,
          child: SwipeCards(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
              );
            },
            onStackFinished: () {},
            matchEngine: _matchEngine,)

      ),
    );
  }
}



_launchURL(link) async {
  Uri url = Uri.parse('$link');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}