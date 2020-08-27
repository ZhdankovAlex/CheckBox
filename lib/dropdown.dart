import 'package:flutter/material.dart';
import 'checkboxList.dart';
import 'language.dart';
import 'state_container.dart';

class CustomDropdown extends StatefulWidget{
  Language our_language;

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
    if(widget.our_language == null){
      widget.our_language = new Language(language: "Русский");
    }
    actionKey = LabeledGlobalKey(widget.our_language.language);
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
    final container = StateContainer.of(context);
    if(container.our_language != null){
      widget.our_language = container.our_language;
    }
    else{
      widget.our_language = new Language(language: "Русский");
    }

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
                Text(widget.our_language.language,
                  style: TextStyle(color: Colors.black, fontSize: 22),),
              ]
          )
      ),
    );
  }
}