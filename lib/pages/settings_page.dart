import 'package:quiz_app/theme/theme_modal.dart';
import 'package:quiz_app/theme/theme_preference.dart';

import 'package:flutter/material.dart';

class Settings_Page extends StatefulWidget {


  @override
  State<Settings_Page> createState() => _SettingsState();
}

  
  

class _SettingsState extends State<Settings_Page> with WidgetsBindingObserver {

     
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
        _imageFuture= precacheImage(AssetImage('assets/images/MG.jpg'), context);
    }
  }
  
 Future openDialog() => showDialog(context:context,
 builder: (context) => AlertDialog(
backgroundColor:  Colors.white,
  scrollable: true,
title: Text("About Us"),

content: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
        Stack(
    
      
    
      children: [
    
    
    
              Padding(
                padding: const EdgeInsets.only(top:25.0),
                child: Center(
                  child: Container(
    
                               
                    child: CircularProgressIndicator(),
    
                  ),
                ),
              ),
    
            
    
                 FutureBuilder(
    
                  
    
                   future:   _imageFuture= precacheImage(AssetImage('assets/images/MG.jpg'), context),
    
                   builder: (context, snapshot) {
    
                     if(snapshot.connectionState == ConnectionState.done)
    
                     {
    
                      return Padding(
    
                        padding: EdgeInsets.zero,
    
                        child: Center(
                          child: ClipOval(
    
    
    
                            child: Container(
    
                              height: 100,
    
                              width: 100,
    
                             
    
                                decoration: BoxDecoration(
    
                              
    
                                  image: DecorationImage(
    
                                  
    
                                    image:  NetworkImage('https://pbs.twimg.com/profile_images/1512455583768915968/pSAZlLAI_400x400.jpg'),
    
                                    fit: BoxFit.cover
    
                                  
    
                                  )
    
                                ),
    
                                
    
                                
    
                             
    
                            ),
    
                          ),
                        ),
    
                      );
    
                     } else{
    
                      return Padding(
    
                        
    
                        padding: EdgeInsets.all(0),
    
                        child: Container(
    
                         height: 150,
    
                         width: 150 ,
    
                        //   width: double.infinity,
    
                        //  color: Colors.black,
    
                        child: CircularProgressIndicator(),
    
                         
    
                        ),
    
                      );
    
                     }
    
                   } 
    
      
    
                    
    
                    
    
                    ) ,
    
                              
    
          
    
      ],
    
    ),
      SizedBox(
    
              height: 10,
    
            ),
    
            Container(
    
       
    
          child: Text("Hello! my name is Mohit Geryani and i'm a software developer.",style: TextStyle(color: Colors.grey, fontSize: 14),),
    
        
    
        ),
  ],
)
 )
 );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
    body: Column(
      children: <Widget>[

       Padding(

          padding: EdgeInsets.only(top: 10),
        
         child: ListTile(
          
          leading: Icon(Icons.info
          // color: Colors.purple
          ),
          onTap: (() {
            openDialog();
          }),
          title: Text("About Us")
         ),
       ),

       ListTile(
    
            title: Text("App Version: 1.0.1", style: TextStyle(color: Colors.grey, fontSize: 10.0),), 
            //leading is list elements having different properties
          ),
 

      ]
    ),
    );
  
  
}
}