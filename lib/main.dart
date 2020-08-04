import 'package:checkbox/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 32.0, right: 32.0),
            child: CustomDropdown(text: "Язык"),
          )
        )
    );
  }
    /*return Scaffold
      (
        appBar: AppBar(title: Text('Checkbox'),
                       centerTitle: true,
                       backgroundColor: const Color(0xffffbe3b)),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>
                      [
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Text (currentLanguage,
                                style: new TextStyle(color: Colors.black
                                                     )),
                          //Russian checkbox
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text ("Русский"),
                            Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
                                  child: Checkbox(value: russianVal,
                                    checkColor: const Color(0xffffbe3b),
                                    activeColor: Colors.black12,
                                    onChanged: (bool value)
                                    {
                                      setState(()
                                      {
                                        englishVal = !value;
                                        russianVal = value;
                                        currentLanguage = "Язык";
                                      });
                                    },
                                   ),
                                  ),
                          ],),
                          //English checkbox
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text ("English"),
                              Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
                                child: Checkbox(value: englishVal,
                                  checkColor: const Color(0xffffbe3b),
                                  activeColor: Colors.black12,
                                  onChanged: (bool value)
                                  {
                                    setState(()
                                    {
                                      englishVal = value;
                                      russianVal = !value;
                                      currentLanguage = "Language";
                                    });
                                  },
                                ),
                              ),
                            ],)
                        ])
                      ],),
                    ),
      );
  }*/
}
