import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)  {
    return MaterialApp
    (
      title: 'Dropdown checkbox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 32.0, right: 32.0),
            child: CustomDropdown(),
          )
        )
    );
  }
}

class CustomDropdown extends StatefulWidget{
  String text;
  CustomDropdown({Key key, this.text = "Язык"}): super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey;

  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;
  IconData shevron = IconData(
      0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
  double height, width, xPosition, yPosition;

  bool isSelectedEnglish = false;
  bool isSelectedRussian = true;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
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
                        child:
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text ("Русский"),
                                Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
                                  child: Checkbox(value: isSelectedRussian,
                                    checkColor: const Color(0xffffbe3b),
                                    activeColor: Colors.black12,
                                    onChanged: (bool value)
                                    {
                                      setState(()
                                      {
                                        widget.text = "Русский";
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
                                    onChanged: (bool value)
                                    {
                                      setState(()
                                      {
                                        widget.text = "Language";
                                        isSelectedEnglish = true;
                                        isSelectedRussian = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
            shevron = IconData(
                0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
          }
          else {
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
          Row
            (
              children: <Widget>[
                Icon(shevron, color: const Color(0xffffbe3b)),
                Text(widget.text,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}