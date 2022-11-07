import "package:flutter/material.dart";

class JokeText extends StatelessWidget {
  const JokeText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
        padding: const EdgeInsets.all(20),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13)),
          ),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFDA1258),
              Color(0xFF190101),
              Color(0xFF000000),
              Color(0xFF01091F),
              Color(0xFF24BBB0),
            ],
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        )
    );
  }
}
