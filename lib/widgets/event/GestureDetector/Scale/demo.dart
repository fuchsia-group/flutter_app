import 'package:flutter/material.dart';

class ScaleDemo extends StatefulWidget {
  @override
  ScaleDemoState createState() {
    return ScaleDemoState();
  }
}

class ScaleDemoState extends State<ScaleDemo> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset('assets/images/ic0.jpg', width: _width),
        onScaleUpdate: (details) {
          //缩放倍数在0.8到10倍之间
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
