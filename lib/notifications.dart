import 'package:flutter/material.dart';
import 'state_container.dart';

class Notifications extends StatefulWidget{

  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications>{
  String notifications = "Уведомления";
  IconData shevron = IconData(
      0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context){

    final container = StateContainer.of(context);
    if(container.our_language != null){
      if(container.our_language.language == "Язык") {
        notifications = "Уведомления";
      }
      else{
        notifications = "Notifications";
      }
    }
    else{
      notifications = "Уведомления";
    }

    return Container(
            decoration:
            BoxDecoration(color: Colors.white,),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
            Row(
                children: <Widget>[
                  Icon(shevron, color: const Color(0xffffbe3b)),
                  Text(notifications,
                    style: TextStyle(color: Colors.black, fontSize: 22),),
                ]
            )
    );
  }
}