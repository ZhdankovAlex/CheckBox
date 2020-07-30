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
  String curentLanguage = "Язык";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text('Checkbox'), centerTitle: true),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>
                      [
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Text (curentLanguage),
                          //Russian checkbox
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text ("Русский"),
                            Checkbox(value: russianVal,
                              onChanged: (bool value)
                              {
                                setState(()
                                {
                                    englishVal = !value;
                                    russianVal = value;
                                    curentLanguage = "Язык";
                                });
                              },)
                          ],),
                          //English checkbox
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text ("English"),
                              Checkbox(value: englishVal,
                                onChanged: (bool value)
                                {
                                  setState(()
                                  {
                                      russianVal = !value;
                                      englishVal = value;
                                      curentLanguage = "Language";
                                  });
                                },)
                            ],)
                        ])
                      ],),
                    ),
      );
  }
}
