import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/newscreen.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/pages/quizDetails/pythonQ.dart';
import 'theme/theme_modal.dart';
import 'modules/navBar.dart';
import 'py_quiz.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'js_quiz.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 


  List<String> langname = [
    "Python",
    "JavaScript"
  ];

  List<String> langdesc = [
    "Python is high level programming language. Its design philosophy emphasizes code readability with the use of significant indentation.",
    "JavaScript often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS."
  ];

  List<String> langimages = [
    "assets/images/pythonlogo.png",
    "assets/images/javascriptlogo.png"
  ];
  
  Widget customcard(String langname, String langimages, String langdesc) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    // child: InkWell(
    //   onTap: () {
    //     debugPrint("Tapped");
    //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    //   {
    //     return Load_json();
    //   }));
    //   },
      child: Material(
        color: Color(0xFF2E2E2e),
        borderRadius: BorderRadius.circular(20.0),
        elevation: 10.0,
        child: Container(
          
          child: Column(
            
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Material(
                  elevation: 10.0,
                  color: Color(0xFF2E2E2e),
                  borderRadius: BorderRadius.circular(75.0),
                  borderOnForeground: false,
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                 
                    child: ClipOval(
                      
                      child: Image(
                        fit: BoxFit.fill,
                        height: 125,
                        width: 125,
                        image: AssetImage(
                          
                          langimages
                        ),
                      ),
                    ),
                  ),
                ),
                
                ),
                Center(
                  child: Text(langname, 
                  style:  TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: "Montserrat"), textAlign: TextAlign.center,),
                ), 
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(langdesc,
                  style: TextStyle(fontFamily: "Montserrat-Regular", color: Colors.white, fontSize: 13.0),
                 maxLines: 5,
                  textAlign: TextAlign.center,
                  ),
                )
            ],
          ),
        ),
      ),
    );
    
    

  }

  @override
  Future<bool> onBackPress() {
    return onBackPress();
  }


  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {

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
        return onBackPress();
      },





      child: Scaffold(
        drawer: Builder(
          builder: (context) {
            return MediaQuery(
              data: MediaQuery.of(context),
          child: Container(
            
            child: Stack(
              
              children: <Widget>[
                  BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0
      ),
       child:  NavBar()
                  )
              ]
              )),);
          }
        ),
        appBar: AppBar(
          title: //Text(themeNotifier.isDark ? "Dark Mode" : "Light Mode"),
          Text("Quiz Buzz"),
          actions: [
            IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                  print("Theme change clicked");
                })
          ],
        ),
    
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (context) {
              return pythonquiz();
            }));
          },
           child: customcard(langname[0], langimages[0], langdesc[0]),
         ),
          InkWell(
          onTap: () {
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            //   return js_quiz();
            // })); 
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> js_quiz()));
          },
           child: customcard(langname[1], langimages[1], langdesc[1]),
         ),
        
      
          
        ],
      ),
      )
    );

  });
  }
}








