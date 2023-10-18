import 'package:flutter/material.dart';
import 'py_quiz.dart';

 

class Answer extends StatelessWidget {
  
bool answerWasSelected = false;

 
final Color AnsColor;
 final  answerText;
 final Color answerColor;
 final answerTap;
 Answer({this.answerText='', this.answerColor= Colors.transparent, this.answerTap, this.AnsColor=Colors.transparent});

 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadiusDirectional.circular(20.0)
        ),
        child: Text(answerText, style: TextStyle(fontSize: 12.0, color: AnsColor ),),
      ),
    );
  }
}

