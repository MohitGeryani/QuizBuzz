import 'dart:ui';

import 'package:flutter/material.dart';
import '/pages/settings_page.dart';

import 'package:flutter/services.dart';

class NavBar extends StatefulWidget {
   NavBar({super.key});

  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with WidgetsBindingObserver {
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
        _imageFuture= precacheImage(AssetImage('assets/images/qbcover.webp'), context);
    }
  }
  
  @override


  Widget build(BuildContext context) {
     _imageFuture= precacheImage(AssetImage('assets/images/qbcover.webp'), context);
    return Drawer(
     
 child: ListView(
        padding: EdgeInsets.zero,

         

      
        children: [

          FutureBuilder(
               future: _imageFuture,
               builder: (context, snapshot) {
                 if(snapshot.connectionState == ConnectionState.done)
                 {
                  return Container(
                    color: Colors.black,
                    child: Image(
                      image: AssetImage('assets/images/qbcover.webp'),
                      fit: BoxFit.cover,
                      
                      height: 150,

                    ),
                  );
                  
                 } else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
                    child: Container(
                      height: 150,
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                          

                //           image: AssetImage('assets/images/qbcover.webp'),
                //  fit: BoxFit.cover
                //         ),
                        
                //       ),

                child: Container(
                   color: Colors.black,
                  child: Center(child: CircularProgressIndicator(),)),
                   
                      
                    ),
                  );
                 }
               } 
  
                
                
                ),

              

              // Container(
              //   width: double.infinity,
              //   height: 150,

                
              // //   decoration: BoxDecoration(
              // //     image: DecorationImage(image: AssetImage('assets/images/qbcover.webp'
                  
              // //     ),
              // // fit: BoxFit.cover                  
              // //     )
                
              // //   ),
              // ),
          


          SizedBox(
            height: 10.0,
          ),
          ListTile(
          
            leading: Icon(Icons.home),
            title: Text("Home"), 
            onTap: (() {
              Navigator.pop(context);
            }), //leading is list elements having different properties
          ),
            ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"), 
            onTap: (() {
              
            }), //leading is list elements having different properties
          ),
            ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"), 
            onTap: (() {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Settings_Page()));
            }), //leading is list elements having different properties
          ),
            ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"), 
            onTap: (() {
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

            }), //leading is list elements having different properties
          ),
          Divider(
            color: Colors.transparent,
             height: 320,
          ),
            ListTile(
    
            title: Text("App Version\n1.0.1", style: TextStyle(color: Colors.grey, fontSize: 10.0),), 
            //leading is list elements having different properties
          )


        ]
      ),
   
   
   );
      
      
    
      

    
  }
}