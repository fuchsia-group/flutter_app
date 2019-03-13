import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  final TextStyle txtStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 100.0,
          )
        ],
      ),
    );
  }
}