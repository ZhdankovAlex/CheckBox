import 'package:flutter/material.dart';
import 'language.dart';

class StateContainer extends StatefulWidget{
  final Widget child;
  final Language language;

  StateContainer({@required this.child, this.language});

  static StateContainerState of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(InheritedStateContainer)
    as InheritedStateContainer).data;
  }

  @override
  State<StatefulWidget> createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer>{
  Language our_language;

  void updateLanguage({current_language}){
    if(our_language == null) {
      our_language = new Language(language: current_language);
      setState(() {
        our_language = current_language;
      });
    }
    else{
      setState(() {
        our_language.language = current_language ?? our_language.language;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedStateContainer extends InheritedWidget{
  final StateContainerState  data;
  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }): super (key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget)  => true;
}