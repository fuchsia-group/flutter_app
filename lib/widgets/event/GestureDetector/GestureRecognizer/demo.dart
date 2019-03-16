import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureRecognizerDemo extends StatefulWidget {
  @override
  GestureRecognizerDemoState createState() {
    return GestureRecognizerDemoState();
  }
}

class GestureRecognizerDemoState extends State<GestureRecognizerDemo> {

  TapGestureRecognizer _tapGestureRecognizer =TapGestureRecognizer();

  bool _toggle =false; // 变色开关

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "你好世界"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
            ),
            TextSpan(text: "你好世界")
          ]
        )
      ),
    );
  }
 
}
