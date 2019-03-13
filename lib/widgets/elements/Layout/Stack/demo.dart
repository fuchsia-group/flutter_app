import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  @override
  StackDemoState createState() {
    return StackDemoState();
  }
}

class StackDemoState extends State<StackDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
           Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(
            child: Text("Hello World", style:TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
