import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  bool russianVal = false;
  bool englishVal = false;
  String currentLanguage = "Язык";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
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
  }
}
