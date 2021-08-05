import 'package:flutter/material.dart';

abstract class BaseDemo extends StatelessWidget {
  final String title = "";

  @protected
  Widget createWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: createWidget(context),
    );
  }
}
