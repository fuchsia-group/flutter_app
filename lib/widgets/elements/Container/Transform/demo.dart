import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  @override
  TransformDemoState createState() {
    return TransformDemoState();
  }
}

class TransformDemoState extends State<TransformDemo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text("Hello World"),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: 90,
                child: Text("Hello World"),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: Text("Hello World"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text("Hello World"),
                  ),
                ),
                Text("你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("Hello World"),
                  ),
                ),
                Text("你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0))
              ],
            )
          ],
        ));
  }
}
