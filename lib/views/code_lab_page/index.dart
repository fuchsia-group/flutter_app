import 'package:flutter/material.dart';
import 'friendly_chat.dart';
import 'widget_view_page.dart';
import 'animated_list.dart';
import 'widget_list.dart';
import 'app_bar_bottom.dart';
import 'basic_app_bar.dart';
import 'tabbed_app_bar.dart';
import 'custom_a11y_traversal.dart';
import 'expansion_tile_sample.dart';
import 'custom_semantics.dart';

class CodeLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CodeLabDemo();
  }
}

class CodeLabDemo extends StatefulWidget {
  @override
  createState() => CodeLabDemoState();
}

class CodeLabDemoState extends State<CodeLabDemo>
    with TickerProviderStateMixin {
  final List _messages = [
    {"text": "FriendlyChat", "widget": FriendlychatApp()},
    {"text": "PageThree", "widget": ViewPageExample()},
    {"text": "AnimatedList", "widget": AnimatedListDemo()},
    {"text": "WidgetList", "widget": WidgetList()},
    {"text": "AppBarBottomSample", "widget": AppBarBottomSample()},
    {"text": "BaseAppBarSample", "widget": BaseAppBarSample()},
    {"text": "TabbedAppBarSample", "widget": TabbedAppBarSample()},
    {"text": "CustomTraversalExample", "widget": CustomTraversalExample()},
    {"text": "ExpansionTileSample", "widget": ExpansionTileSample()},
    {
      "text": "AdjustableDropdownExample",
      "widget": AdjustableDropdownExample()
    },
  ];

  @override
  void initState() {
    super.initState();
    _messages.sort((a, b) => a["text"].compareTo(b["text"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeLab"),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => _buildItem(index),
        itemCount: _messages.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey, height: 1.0);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      leading: CircleAvatar(child: Text(_messages[index]["text"][0])),
      title: Text(_messages[index]["text"]),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return _messages[index]["widget"];
        }));
      },
    );
  }

  // Widget _buildItem1(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return _messages[index]["widget"];
  //       }));
  //     },
  //     child: Container(
  //       color: Colors.transparent,
  //       padding: EdgeInsets.all(10.0),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           CircleAvatar(
  //             child: Text(_messages[index]["text"][0]),
  //           ),
  //           Container(
  //               margin: EdgeInsets.only(left: 5.0),
  //               child: Text(
  //                 _messages[index]["text"],
  //                 style: TextStyle(fontSize: 18.0),
  //               ))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
