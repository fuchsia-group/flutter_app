import 'package:flutter/material.dart';

class PaddingDemo extends StatefulWidget {
  @override
  PaddingDemoState createState() {
    return PaddingDemoState();
  }
}

class PaddingDemoState extends State<PaddingDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 上下左右各添加16像素补白
      padding: EdgeInsets.all(16.0),
      child: Column(
        // 显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Hello World"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I am Jack"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
