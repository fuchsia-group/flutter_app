import 'package:flutter/material.dart';
import 'model/widget.dart';
import 'widgets/index.dart';

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
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widgetDemosList.length,
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return new Divider();
        }
        return _buildRow(widgetDemosList[i]);
      },
    );
  }

  Widget _buildRow(WidgetPoint widgetPoint) {
    return ListTile(
      title: Text(widgetPoint.name),
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return ;
        // }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItems();
  }
}
