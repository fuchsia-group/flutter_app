import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatefulWidget {
  @override
  DecoratedBoxDemoState createState() {
    return DecoratedBoxDemoState();
  }
}

class DecoratedBoxDemoState extends State<DecoratedBoxDemo> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
          borderRadius: BorderRadius.circular(3.0), // 3像素圆角
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text("Login", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
