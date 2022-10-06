import "package:flutter/material.dart";

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.like, required this.dislike});

  final VoidCallback like;
  final VoidCallback dislike;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: dislike,
            tooltip: 'dislike',
            backgroundColor: Colors.black,
            foregroundColor: Colors.tealAccent,
            splashColor: Colors.pink,
            child: const Icon(Icons.heart_broken_sharp),
          ),
          FloatingActionButton(
            onPressed: like,
            tooltip: 'like',
            backgroundColor: Colors.black,
            foregroundColor: Colors.pink.shade400,
            splashColor: Colors.teal.shade300,
            child: const Icon(Icons.favorite_sharp),
          ),
        ],
      ),
    );
  }
}