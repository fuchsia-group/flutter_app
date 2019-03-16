import 'package:flutter/material.dart';
import './demo.dart';

class Demo extends StatelessWidget {

  static const String routeName = '/components/InheritedWidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      // body: Center( 
      //   child: Text("This is new route"),
      // ),
      body: InheritedWidgetDemo(),
    );
  }
}