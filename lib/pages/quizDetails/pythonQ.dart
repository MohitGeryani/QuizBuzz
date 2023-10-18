import 'package:flutter/material.dart';
import 'package:quiz_app/py_quiz.dart';
import 'package:quiz_app/homepage.dart';

class pythonquiz extends StatefulWidget {
  const pythonquiz({super.key});

  @override
  _pythonquizState createState() => _pythonquizState();

}


class _pythonquizState extends State<pythonquiz> with WidgetsBindingObserver {

    
  Future? _imageFuture;

@override
 
void initState() {
  super.initState();
  WidgetsBinding.instance.addObserver(this);

}
  
  @override
  void dispose() {
     WidgetsBinding.instance.removeObserver(this);
     super.dispose();
  }

  @override

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state== AppLifecycleState.resumed) {
        _imageFuture= precacheImage(AssetImage('assets/images/pythonqiz.webp'), context);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    
   _imageFuture= precacheImage(AssetImage('assets/images/pythonquiz.webp'), context);
    return Scaffold(
      appBar: AppBar(title: Text("Python Quiz")
      
    
      ),
      body: ListView(
        children: <Widget> [
          Stack(
      
          children: [
           
             FutureBuilder(
               future: _imageFuture,
               builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.done)
                 {
                  return Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(image: AssetImage('assets/images/pythonquiz.webp'
                          
                          ),
                          fit: BoxFit.cover
                          
                          )
                        ),
                        
                        
                     
                    ),
                  );
                 } else{
                  return Padding(
                    
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                     color: Colors.black,
                     
                    ),
                  );
                 }
               } 
  
                
                
                ) ,
                          
                          //decoration: BoxDecoration(
                           
                           
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/pythonquiz.webp'),
                            //   fit: BoxFit.fitWidth,
                              
                              
                            // ),
                            // boxShadow:[ BoxShadow(
                            //   color: Colors.grey,
                            //   offset: Offset(.0,1.0),
                            //   blurRadius: 6.0
                            // ) 
                            // ],
                          
                          
                         
              
              

          ]
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Quiz Info: ", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("This is a python quiz for an intermediate python programmers, this quiz contains 9 questions and every question must be answered before moving to next question, Good Luck!... ", style: TextStyle(fontSize: 14), textAlign: TextAlign.start,),
                  
                   SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: FloatingActionButton(onPressed: (() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => py_quiz()));
                      }),

                    child: Icon(Icons.start),
                    
                    ),
                  )
                ]
              ),
            )
          ],
      
        ),
        
      );
    
  }
}