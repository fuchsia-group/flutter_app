import 'package:flutter/material.dart';
import 'package:flutter_app/views/first_page/first_page.dart';
import 'package:flutter_app/views/code_lab_page/index.dart';
import 'package:flutter_app/widgets/404.dart';

class HemoPage extends StatefulWidget {
  @override
  HemoPageState createState() {
    return HemoPageState();
  }
}

class HemoPageState extends State<HemoPage> {
  static List tabs = [
    {"text": Text("WIDGET"), "icon": Icon(Icons.extension)},
    {"text": Text("CodeLab"), "icon": Icon(Icons.code)},
    {"text": Text("About"), "icon": Icon(Icons.import_contacts)}
  ];

  List<BottomNavigationBarItem> myTabs = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < tabs.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        title: tabs[i]['text'],
        icon: tabs[i]['icon'],
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          MyHomePage(),
          CodeLab(),
          WidgetNotFound(),
        ],
        index: _selectedIndex,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData( // 去掉点击水波纹
            brightness: Theme.of(context).brightness,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          items: myTabs,
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
