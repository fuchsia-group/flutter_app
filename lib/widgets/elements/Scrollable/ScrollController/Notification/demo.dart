import 'package:flutter/material.dart';

class ScrollNotificationDemo extends StatefulWidget {
  @override
  ScrollNotificationDemoState createState() {
    return ScrollNotificationDemoState();
  }
}

class ScrollNotificationDemoState extends State<ScrollNotificationDemo> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          return true;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              },
            ),
            CircleAvatar(
              radius: 30,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
