import 'package:flutter/material.dart';

class VerticalDragDemo extends StatefulWidget {
  @override
  VerticalDragDemoState createState() {
    return VerticalDragDemoState();
  }
}

class VerticalDragDemoState extends State<VerticalDragDemo> {
  double _top = 0.0; //距顶部的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            onVerticalDragUpdate: (e) {
              setState(() {
                _top += e.delta.dy;
              });
            },
          ),
        ),
      ],
    );
  }
}
