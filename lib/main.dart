import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  bool checkboxVal = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text('Checkbox'), centerTitle: true),
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>
                      [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text ("Push it!"),
                            Checkbox(value: checkboxVal,
                              onChanged: (bool value)
                              {
                                setState(()
                                {
                                  checkboxVal = value;
                                });
                              },)
                          ],)
                        ]),
                        Text("Value: $checkboxVal\n")
                      ],),
                    ),
      );
  }
}
