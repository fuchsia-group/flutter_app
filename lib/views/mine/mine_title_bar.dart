import 'package:flutter/material.dart';

class MineTitleBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  createState() => _MineTitleBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class _MineTitleBarState extends State<MineTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: Color(0xff4897fa)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("22C", style: TextStyle(color: Colors.white)),
          IconButton(
            icon: Icon(Icons.mail),
            iconSize: 24.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
