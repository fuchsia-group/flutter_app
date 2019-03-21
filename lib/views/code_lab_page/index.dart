import 'package:flutter/material.dart';
import 'friendly_chat.dart';

class CodeLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CodeLabDemo();
  }
}

class CodeLabDemo extends StatefulWidget {
  @override
  createState() => CodeLabDemoState();
}

class CodeLabDemoState extends State<CodeLabDemo>
    with TickerProviderStateMixin {
  final List _messages = [
    {"text": "FriendlyChat", "widget": FriendlychatApp()},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeLab"),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => _buildItem(index),
        itemCount: _messages.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return _messages[index]["widget"];
        }));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Text(_messages[index]["text"][0]),
            ),
            Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  _messages[index]["text"],
                  style: TextStyle(fontSize: 18.0),
                ))
          ],
        ),
      ),
    );
  }
}
