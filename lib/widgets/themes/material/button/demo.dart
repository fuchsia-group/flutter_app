import 'package:flutter/material.dart';

class MaterialButtonDemo extends StatelessWidget {
  final TextStyle txtStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              print('click MaterialButton');
            },
            child: Text(
              'MaterialButton',
              style: txtStyle,
            ),
            color: Theme.of(context).primaryColor,
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("FlatButton"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              print("click FlatButton");
            },
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.bubble_chart,
              color: Colors.white,
            ),
            label: Text(
              'FlatButton.Icon',
              style: txtStyle,
            ),
            onPressed: () {
              print('click FlatButton');
            },
            color: Theme.of(context).primaryColor,
          ),
          RaisedButton(
            onPressed: () {
              print('click RaisedButton');
            },
            child: Text('RaisedButton'),
          ),
          OutlineButton(
            child: Text("normal"),
            onPressed: () {
              print("click OutlineButton");
            },
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: (){
              print("click IconButton");
            },
          )
        ],
      ),
    );
  }
}