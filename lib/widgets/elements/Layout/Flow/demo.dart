import 'package:flutter/material.dart';

class FlowDemo extends StatefulWidget {
  @override
  FlowDemoState createState() {
    return FlowDemoState();
  }
}

class FlowDemoState extends State<FlowDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(width: 80.0, height: 80.0, color: Colors.red),
        Container(width: 80.0, height: 80.0, color: Colors.green),
        Container(width: 80.0, height: 80.0, color: Colors.blue),
        Container(width: 80.0, height: 80.0, color: Colors.yellow),
        Container(width: 80.0, height: 80.0, color: Colors.brown),
        Container(width: 80.0, height: 80.0, color: Colors.purple)
      ],
    );
  }
}

class TestFlowDelegate implements FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200.0);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (var i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRelayout(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;
  }
}
