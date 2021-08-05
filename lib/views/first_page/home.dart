import 'package:flutter/material.dart';
import 'package:flutter_app/views/first_page/first_page.dart';
import 'package:flutter_app/views/code_lab_page/index.dart';
import 'package:flutter_app/views/mine/mine.dart';
import 'package:flutter_app/views/api/api.dart';

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
    {"text": Text("API"), "icon": Icon(Icons.apps)},
    {"text": Text("Mine"), "icon": Icon(Icons.person)},
  ];

  List<BottomNavigationBarItem> myTabs = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < tabs.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        label: (tabs[i]['text'] as Text).data,
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
        children: <Widget>[MyHomePage(), CodeLab(), API(), MinePage()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            // 去掉点击水波纹
            brightness: Theme.of(context).brightness,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          items: myTabs,
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
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
