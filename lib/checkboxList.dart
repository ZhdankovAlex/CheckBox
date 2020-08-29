import 'package:flutter/material.dart';
import 'language.dart';
import 'state_container.dart';

class CheckboxList extends StatefulWidget{
  @override
  _CheckboxList createState() => _CheckboxList();
}

class _CheckboxList extends State <CheckboxList>{
  Language currentLanguage;

  bool isSelectedEnglish;
  bool isSelectedRussian;

  Save(){
    final container = StateContainer.of(context);
    container.updateLanguage(current_language: currentLanguage.language);
  }

  @override
  Widget build(BuildContext context){

    currentLanguage = StateContainer.of(context).our_language;

    if(currentLanguage != null){
      if(currentLanguage.language == "Язык"){
        isSelectedRussian = true;
        isSelectedEnglish = false;
      }
      else{
        isSelectedRussian = false;
        isSelectedEnglish = true;
      }
    } else{
      currentLanguage = new Language(language: "Язык");
      isSelectedRussian = true;
      isSelectedEnglish = false;
    }

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
                    currentLanguage = new Language(language: "Язык");
                    isSelectedEnglish = false;
                    isSelectedRussian = true;
                    Save();
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
                    currentLanguage = new Language(language: "Language");
                    isSelectedEnglish = true;
                    isSelectedRussian = false;
                    Save();
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