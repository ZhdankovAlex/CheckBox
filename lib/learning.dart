import 'package:flutter/material.dart';
import 'state_container.dart';
import 'learning_window.dart';

class Learning extends StatefulWidget{

  @override
  _Learning createState() => _Learning();
}

class _Learning extends State<Learning>{
  String learning = "Обучение";
  IconData shevron = IconData(
      0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context){
    final container = StateContainer.of(context);
    if(container.our_language != null){
      if(container.our_language.language == "Язык") {
        learning = "Обучение";
      }
      else{
        learning = "Learning";
      }
    }
    else{
      learning = "Обучение";
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LearningScreen(),
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
                Text(learning,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}