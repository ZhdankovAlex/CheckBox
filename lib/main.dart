import 'package:checkbox/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyAppState()));

class MyAppState extends StatefulWidget
{
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<MyAppState>
{
  String currentLanguage = "Язык";

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Dropdown checkbox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 32.0, right: 32.0),
            child: CustomDropdown(text: currentLanguage),
          )
        )
    );
  }
}
