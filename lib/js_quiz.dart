import 'package:flutter/material.dart';

class js_quiz extends StatefulWidget {

  @override
  State<js_quiz> createState() => _js_quizState();
}

class _js_quizState extends State<js_quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JavaScript Quiz"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),),
      body: Container(
                    color: Colors.blue,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/images/MG.jpg'),
                      fit: BoxFit.cover,
                      
                      height: 150,

                    ),
                  ),
    );
  }
}
