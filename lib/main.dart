import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'checkboxList.dart';
import 'learning.dart';
import 'notifications.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget{
  
  String profile = "Профиль";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Profile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey[800],
          accentColor: Colors.grey[50],
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                  children: <Widget>[
                    Text(profile,
                         style: TextStyle(color: Colors.white, fontSize: 22),),
                    Spacer(),
                    Icon(Icons.menu, color: Colors.white, size: 32),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 0, left: 32.0, right: 32.0),
              child: Column(
                  children: <Widget>[
                    CustomDropdown(),
                  ],
              ),
            ),
        )
    );
  }
}

class CustomDropdown extends StatefulWidget{
  String language;
  CustomDropdown({Key key, this.language = "Язык"}): super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>{
  GlobalKey actionKey;

  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;
  IconData shevron = IconData(
      0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
  double height, width, xPosition, yPosition;

  @override
  void initState(){
    actionKey = LabeledGlobalKey(widget.language);
    super.initState();
  }

  void findDropdownData(){
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown(){
    return OverlayEntry(builder: (context){
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 2 * height + 40,
        child: Column(
          children: <Widget>[
            Material(
              elevation: 20,
              child: Container(
                decoration: BoxDecoration(color: Colors.black12,),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:16, vertical:8),
                      child: CheckboxList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      key: actionKey,
      onTap: (){
        setState((){
          if (isDropdownOpened){
            floatingDropdown.remove();
            shevron = IconData(
                0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
          }
          else{
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
            shevron = IconData(0xe5cf, fontFamily: 'MaterialIcons');
          }
          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
          decoration:
          BoxDecoration(color: Colors.white,),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
          Row(
              children: <Widget>[
                Icon(shevron, color: const Color(0xffffbe3b)),
                Text(widget.language,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}