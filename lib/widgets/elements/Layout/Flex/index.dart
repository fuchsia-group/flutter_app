import 'package:flutter/material.dart';
import './demo.dart';

class Demo extends StatelessWidget {

  static const String routeName = '/element/Layout/Flex';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      // body: Center( 
      //   child: Text("This is new route"),
      // ),
      body: FlexDemo(),
    );
  }
}