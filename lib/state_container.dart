import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StateContainer extends StatefulWidget {
  final Widget child;

  StateContainer({@required this.child});

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  State<StatefulWidget> createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  int counter;
  String appTitle;

  void initState() {
    counter = 0;
    appTitle = 'Flutter Inherited Widget Demo';
    super.initState();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(data: this, child: widget.child);
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
