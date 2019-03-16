import 'package:flutter/material.dart';
import './demo.dart';

class Demo extends StatelessWidget {

   static const String routeName = '/element/Scrollable/GridView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动"),
      ),
      body: DragDemo(),
    );
  }
}