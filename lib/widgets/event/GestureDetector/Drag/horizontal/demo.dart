import 'package:flutter/material.dart';

class HorizontalDragDemo extends StatefulWidget {
  @override
  HorizontalDragDemoState createState() {
    return HorizontalDragDemoState();
  }
}

class HorizontalDragDemoState extends State<HorizontalDragDemo> {
  double _left = 0.0; //距顶部的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            onHorizontalDragUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }
}
