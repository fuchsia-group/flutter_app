import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem(
      {Key key, this.leading, this.title, this.trailing, this.trailingIcon})
      : super(key: key);

  final IconData leading;

  final String title;

  final String trailing;

  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(leading),
          SizedBox(
            width: 10,
          ),
          Text(title),
          Expanded(
            child: Text(
              trailing,
              textAlign: TextAlign.right,
              style: TextStyle(color: Color(0xffcccccc)),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            trailingIcon,
            size: 12,
          )
        ],
      ),
    );
  }
}
