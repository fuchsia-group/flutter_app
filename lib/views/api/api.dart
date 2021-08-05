import 'package:flutter/material.dart';
import 'future_builder.dart';

class API extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return APIDemo();
  }
}

class APIDemo extends StatefulWidget {
  @override
  createState() => APIDemoState();
}

class APIDemoState extends State<APIDemo> with TickerProviderStateMixin {
  final List _messages = [
    {"text": "FutureBuilder", "widget": FutureBuilderSample()},
  ];

  @override
  void initState() {
    super.initState();
    _messages.sort((a, b) => a["text"].compareTo(b["text"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => _buildItem(index),
        itemCount: _messages.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey, height: 1.0);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      leading: CircleAvatar(child: Text(_messages[index]["text"][0])),
      title: Text(_messages[index]["text"]),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return _messages[index]["widget"];
        }));
      },
    );
  }
}
