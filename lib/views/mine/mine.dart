import 'package:flutter/material.dart';
import 'mine_title_bar.dart';
import 'mine_body.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("22"),
          actions: <Widget>[Icon(Icons.mail)],
          elevation: 0,
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[MineTop(), MineBody()],
            ),
          ),
        ));
  }
}

class MineTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      constraints: BoxConstraints.tight(Size.fromHeight(130.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.tightFor(width: 80, height: 80),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueGrey[100]!, width: 3)),
              ),
              Icon(
                Icons.person,
                size: 50,
                color: Colors.blue,
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "10086",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
