import 'package:flutter/material.dart';

class CheckboxList extends StatefulWidget{
  String currentLanguage;
  CheckboxList({Key key, this.currentLanguage = "Язык"}): super(key: key);

  @override
  _CheckboxList createState() => _CheckboxList();
}

class _CheckboxList extends State <CheckboxList>{

  bool isSelectedEnglish = false;
  bool isSelectedRussian = true;

  @override
  Widget build(BuildContext context){
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("Русский"),
            Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
              child: Checkbox(value: isSelectedRussian,
                checkColor: const Color(0xffffbe3b),
                activeColor: Colors.black12,
                onChanged: (bool value){
                  setState((){
                    widget.currentLanguage = "Язык";
                    isSelectedEnglish = false;
                    isSelectedRussian = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text ("English"),
            Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
              child: Checkbox(value: isSelectedEnglish,
                checkColor: const Color(0xffffbe3b),
                activeColor: Colors.black12,
                onChanged: (bool value){
                  setState((){
                    widget.currentLanguage = "Language";
                    isSelectedEnglish = true;
                    isSelectedRussian = false;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}