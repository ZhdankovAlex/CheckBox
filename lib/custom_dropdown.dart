import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget
{
  final String text;
  const CustomDropdown({Key key, @required this.text}): super(key: key);
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
  //String currentLanguage = "Язык";

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
        child: DropDown(
            itemHeight: height,
          ),
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
        });
      },
     child: Container(
      decoration:
          BoxDecoration(
            color:Colors.white,
          ),
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

class DropDown extends StatelessWidget
{
  final double itemHeight;
  const DropDown({Key key, this.itemHeight}): super(key:key);
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: <Widget>[
        /*SizedBox(height: 5,),
        Align(
          alignment: Alignment(-0.9, 0),
          child: ClipPath(
            clipper:
              ArrowClipper(),
            child:
              Container(
              height: 20,
              width: 30,
              decoration:
                BoxDecoration(
                  color: Colors.black12,
                ),
              ),
          ),
        ),*/
        Material(
          elevation: 20,
          child: Container(
            height: 2 * itemHeight,
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Column(
             children: <Widget>[
              DropDownItem(
                text: "Русский",
                //checkbox!!!!!!!!!!!????????????????????
              ),
              DropDownItem(
                text: "English",
                //checkbox!!!!!!!!!!!????????????????????
              ),
            ],
          ),
        ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget
{
  final String text;
  final bool isSelected;

  const DropDownItem({Key key, this.text, this.isSelected}): super (key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
        decoration:
        BoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal:16, vertical:8),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text (text),

          ],
        ),
    );
  }
}

/*class ArrowClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size)
  {
   Path path = Path();
   path.moveTo(0, size.height);
   path.lineTo(size.width/2, 0);
   path.lineTo(size.width, size.height);
   return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)
  {

  }
}*/



