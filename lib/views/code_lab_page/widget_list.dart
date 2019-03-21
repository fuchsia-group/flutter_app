import 'package:flutter/material.dart';
import 'package:flutter_app/model/widget.dart';
import 'package:flutter_app/widgets/index.dart';

class WidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetList"),
      ),
      body: WidgetListDemo(),
    );
  }
}

class WidgetListDemo extends StatefulWidget {
  @override
  WidgetListDemoState createState() {
    return WidgetListDemoState();
  }
}

class WidgetListDemoState extends State<WidgetListDemo> {
  List widgetDemosList = WidgetDemoList().getDemos();

  @override
  void initState() {
    super.initState();
    widgetDemosList.forEach((item) {
      if (item is WidgetPoint) {
        print(item.routerName);
      }
    });
  }

  Widget _buildItems() {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: widgetDemosList.length,
      itemBuilder: (context, i) => _buildRow(widgetDemosList[i]),
      separatorBuilder: (context,index) {
        return Divider();
      },
    );
  }

  Widget _buildRow(WidgetPoint widgetPoint) {
    return ListTile(
      title: Text(widgetPoint.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItems();
  }
}
