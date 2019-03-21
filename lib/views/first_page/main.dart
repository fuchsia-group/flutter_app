import 'package:flutter/material.dart';

class HemoPage extends StatefulWidget {
  @override
  HemoPageState createState() {
    return HemoPageState();
  }
}

class HemoPageState extends State<HemoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static List tabs = [
    {"text": "WIDGET", "icon": Icon(Icons.extension)},
    {"text": "CodeLab", "icon": Icon(Icons.code)},
    {"text": "About", "icon": Icon(Icons.import_contacts)}
  ];

  String appBarTitle = tabs[0]['text'];
  var _pageController = new PageController(initialPage: 0);
  List<Widget> myTabs = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
    for (var i = 0; i < tabs.length; i++) {
      myTabs.add(Tab(
        text: tabs[i]['text'],
        icon: tabs[i]['icon'],
      ));
    }
    _tabController.addListener(() {
      _onTabChange();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        controller: _pageController,
        onPageChanged: _onItemTapped,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text("第$index 个页面"),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("附近")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onTabChange() {
    if (this.mounted) {
      this.setState(appBarTitle = tabs[_tabController.index]["text"]);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onAdd() {}
}
