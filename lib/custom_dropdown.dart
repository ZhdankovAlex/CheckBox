import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget
{
  String text;
  CustomDropdown({Key key, @required this.text}): super(key: key);
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
{
  GlobalKey actionKey;
  bool isDropdownOpened = false;
  OverlayEntry floatingDropdown;
  IconData shevron = IconData(0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
  double height, width, xPosition, yPosition;

  @override
  void initState()
  {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData()
  {
   RenderBox renderBox = actionKey.currentContext.findRenderObject();
   height = renderBox.size.height;
   width = renderBox.size.width;
   Offset offset = renderBox.localToGlobal(Offset.zero);
   xPosition = offset.dx;
   yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown()
  {
    return OverlayEntry(builder: (context)
    {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 2 * height + 40,
        child: DropDownState(itemHeight: height,),
      );
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      key: actionKey,
      onTap: ()
      {
        setState(()
        {
          if (isDropdownOpened)
          {
            floatingDropdown.remove();
            shevron = IconData(0xe5cc, fontFamily: 'MaterialIcons', matchTextDirection: true);
          }
          else
            {
              findDropdownData();
              floatingDropdown = _createFloatingDropdown();
              Overlay.of(context).insert(floatingDropdown);
              shevron = IconData(0xe5cf, fontFamily: 'MaterialIcons');
            }
          isDropdownOpened = !isDropdownOpened;
          //Navigator.pop(context);
        });
      },
     child: Container(
      decoration:
          BoxDecoration(color:Colors.white,),
      padding: const EdgeInsets.symmetric(horizontal:16, vertical:8),
      child:
        Row
        (
            children: <Widget>
            [
              Icon(shevron, color: const Color(0xffffbe3b)),
              Text(widget.text, style: TextStyle(color: Colors.black, fontSize: 22),),
            ]
        )
    ),
    );
  }
}

class DropDownState extends StatefulWidget
{
  final double itemHeight;
  DropDownState({Key key, this.itemHeight}): super(key: key);
  @override
  DropDown createState() => DropDown();
}

class DropDown extends State<DropDownState>
{
  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: <Widget>[
        Material(
          elevation: 20,
          child: Container(
            decoration: BoxDecoration(color: Colors.black12,),
            child: Column(
             children: <Widget>[
               DropDownItemState(),
            ],
          ),
        ),
        ),
      ],
    );
  }
}

class DropDownItemState extends StatefulWidget
{
  bool isSelectedEnglish;
  bool isSelectedRussian;
  DropDownItemState({Key key,
    this.isSelectedEnglish = false,
    this.isSelectedRussian = true,
  }): super (key: key);
  @override
  DropDownItem createState() => DropDownItem();
}

class DropDownItem extends State<DropDownItemState>
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal:16, vertical:8),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Russian checkbox
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text ("Русский"),
                Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
                  child: Checkbox(value: widget.isSelectedRussian,
                    checkColor: const Color(0xffffbe3b),
                    activeColor: Colors.black12,
                    onChanged: (bool value)
                    {
                      setState(()
                      {
                        widget.isSelectedEnglish = !value;
                        widget.isSelectedRussian = value;
                        //Navigator.push(context, new MaterialPageRoute(builder: (context) => new CustomDropdown(text: "Язык")));
                      });
                    },
                  ),
                ),
              ],
            ),
            //English checkbox
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text ("English"),
                Theme(data: ThemeData(unselectedWidgetColor: Colors.black54,),
                  child: Checkbox(value: widget.isSelectedEnglish,
                    checkColor: const Color(0xffffbe3b),
                    activeColor: Colors.black12,
                    onChanged: (bool value)
                    {
                      setState(()
                      {
                        widget.isSelectedEnglish = value;
                        widget.isSelectedRussian = !value;
                        //Navigator.push(context, new MaterialPageRoute(builder: (context) => new CustomDropdown(text: "Language")));
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}



