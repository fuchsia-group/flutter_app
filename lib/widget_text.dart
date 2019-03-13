import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello world!' * 2,
            ),
            Text(
              'Hello world!' * 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text("Hello world!",
              textScaleFactor: 1.5,
            ),
            Text("Hello world!",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dashed
              ),
            )
          ],
      );
  }
  
}