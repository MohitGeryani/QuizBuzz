import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Load_json extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
    List myData;
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
        builder: (context, snapshot) {
        List myData = json.decode(snapshot.data.toString());
        if (myData==null) {
          return Center(
            child: Text("Loading"),
          );
        }  else {
        
          return Quiz_page(myData: myData);
        }       
        },
        
        ),
    );
  }
}

class Quiz_page extends StatefulWidget {
  
  
  final myData;
  
  Quiz_page(
    {Key? key, @required this.myData}) : super(key : key);

  @override
 
  State<Quiz_page> createState() => _Quiz_pageState(myData: myData);
}

class _Quiz_pageState extends State<Quiz_page> {

  List myData;
  _Quiz_pageState({required this.myData});

  Future<bool> onBackpress() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        showDialog(
    context: context,
   builder: (context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("Are you Sure To Exit!"),
      actions: <Widget>[
        TextButton(
          onPressed:(() {
        SystemNavigator.pop();
        })
        , child: Text("Yes")
        ),
        TextButton(
          onPressed:(() {
          Navigator.of(context).pop(false);
        })
        , child: Text("No")
        )
      ],
    );
   }
   
   );
          

        return onBackpress();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Quiz")),
        body: Center(
          child: Text(myData.toString()) ),
      ),
    );
  }
}