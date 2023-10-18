import 'package:flutter/material.dart';

class newscr extends StatefulWidget {
  const newscr({super.key});

  @override
  State<newscr> createState() => _newscrState();
}

class _newscrState extends State<newscr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NEWSCR")),
      
      body: Text("New Scr"),
    );
  }
}