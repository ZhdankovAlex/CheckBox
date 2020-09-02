import 'package:flutter/material.dart';
import 'state_container.dart';
import 'profile_window.dart';

class Profile extends StatefulWidget{

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile>{
  String profile = "Сменить профиль";
  IconData shevron = IconData(
      0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context){
    final container = StateContainer.of(context);
    if(container.our_language != null){
      if(container.our_language.language == "Язык") {
        profile = "Сменить профиль";
      }
      else{
        profile = "Choose profile";
      }
    }
    else{
      profile = "Сменить профиль";
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            )
        );
      },
      child: Container(
          decoration:
          BoxDecoration(color: Colors.white,),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
          Row(
              children: <Widget>[
                Icon(shevron, color: const Color(0xffffbe3b)),
                Text(profile,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}