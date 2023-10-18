import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/homepage.dart';

import 'main.dart';



class splashscr extends StatefulWidget {
 

  @override
  State<splashscr> createState() => _splashscrState();
}

class _splashscrState extends State<splashscr> {

  
  
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
      {
        return HomePage();
      }
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text("Quiz Buzz", textAlign: TextAlign.center ,  style: TextStyle(fontSize: 45.0, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Cursive"),),
      ),
      
    );
  }
}