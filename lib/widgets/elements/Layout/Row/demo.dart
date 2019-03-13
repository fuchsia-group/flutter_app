import 'package:flutter/material.dart';

class RowDemo extends StatefulWidget {
  @override
  RowDemoState createState() {
    return RowDemoState();
  }
}

class RowDemoState extends State<RowDemo> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello World "),
            Text("I am Jack")
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello World "),
            Text("I am Jack")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text("Hello World "),
            Text("I am Jack ")
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text("Hello World",style:TextStyle(fontSize: 30.0)),
            Text("I am Jack")
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text("Hello World",style:TextStyle(fontSize: 30.0)),
            Text("I am Jack")
          ],
        )
      ],
    );
  }
}
