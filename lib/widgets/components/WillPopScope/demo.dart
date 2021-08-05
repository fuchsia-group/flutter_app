import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  @override
  WillPopScopeDemoState createState() {
    return WillPopScopeDemoState();
  }
}

class WillPopScopeDemoState extends State<WillPopScopeDemo> {
  DateTime? _lastPressedAt; // 上次点击时间

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
    );
  }
}
