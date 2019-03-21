import 'package:flutter/material.dart';
import './demo.dart';

class Demo extends StatelessWidget {

  static const String routeName = '/components/ExpansionTile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpansionTile"),),
      body: ExpansionTileDemo(),
    );
  }
}