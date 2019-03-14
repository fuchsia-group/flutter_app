import 'package:flutter/material.dart';
import './demo.dart';

class Demo extends StatelessWidget {

  static const String routeName = '/element/Container/DecoratedBox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBox"),
      ),
      // body: Center( 
      //   child: Text("This is new route"),
      // ),
      body: TransformDemo(),
    );
  }
}