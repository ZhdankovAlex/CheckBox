import 'package:flutter/material.dart';
import 'state_container.dart';

class ProfileScreen extends StatelessWidget{
  String back = "Вернуться";

  @override
  Widget build(BuildContext context){

    final container = StateContainer.of(context);
    if(container.our_language != null){
      if(container.our_language.language == "Язык") {
        back = "Вернуться";
      }
      else{
        back = "Go Back";
      }
    }
    else{
      back = "Вернуться";
    }

    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
          decoration:
          BoxDecoration(color: Colors.white,),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
          Row(
              children: <Widget>[
                Icon(Icons.keyboard_backspace, color: const Color(0xffffbe3b)),
                Spacer(),
                Text(back,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}