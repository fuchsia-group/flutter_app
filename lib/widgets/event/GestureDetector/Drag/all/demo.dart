import 'package:flutter/material.dart';

class DragDemo extends StatefulWidget {
  @override
  DragDemoState createState() {
    return DragDemoState();
  }
}

class DragDemoState extends State<DragDemo> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}
