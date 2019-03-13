import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatefulWidget {
  @override
  ConstrainedBoxDemoState createState() {
    return ConstrainedBoxDemoState();
  }
}

class ConstrainedBoxDemoState extends State<ConstrainedBoxDemo> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, // 宽度尽可能大
              minHeight: 50.0),
          child: Container(
            height: 5.0,
            child: redBox,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: redBox,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: 90.0, minHeight: 20.0, maxHeight: 100.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 60.0, minHeight: 60.0, maxHeight: 120.0),
              child: redBox,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: redBox,
                ),
              )),
        )
      ],
    );
  }
}
