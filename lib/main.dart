import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'state_container.dart';

void main(){
  runApp(StateContainer(child: new MyApp(),));
}

class MyApp extends StatelessWidget{
  String profile = "Профиль";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Profile',
        theme: ThemeData(
          primaryColor: Colors.grey[800],
          accentColor: Colors.grey[50],
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Row(
                children: <Widget>[
                  Text(profile,
                    style: TextStyle(color: Colors.white, fontSize: 22),),
                  Spacer(),
                  Icon(Icons.menu, color: Colors.white, size: 32),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 0, left: 32.0, right: 32.0),
            child: Column(
              children: <Widget>[
                CustomDropdown(),
              ],
            ),
          ),
        )
    );
  }
}
