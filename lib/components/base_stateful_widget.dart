import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  // State<BaseStatefulWidget> state;

  @override
  createState() => _BaseStatefulWidgetState();

  @protected
  Widget build(BuildContext context);

  void initState() {}

  void dispose() {}
}

class _BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // widget.state = this;
    return widget.build(context);
  }
}
