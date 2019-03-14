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
    {"text": "首页", "icon": Icon(Icons.home)},
    {"text": "附近", "icon": Icon(Icons.map)},
    {"text": "我的", "icon": Icon(Icons.person)}
  ];

  String appBarTitle = tabs[0]['text'];

  List<Widget> myTabs = [];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0,length: tabs.length, vsync: this);
    for (var i = 0; i < tabs.length; i++) {
      myTabs.add(Tab(text: tabs[i]['text'],icon: tabs[i]['icon'],));
    }
    _tabController.addListener((){
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
      appBar: AppBar(
        title: Text("首页"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
        // bottom: TabBar(
        //     controller: _tabController,
        //     tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: <Widget>[
      //     MyHomePage(),
      //     MyHomePage(),
      //     MyHomePage(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("附近")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("我的")),
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
      this.setState(
        appBarTitle =tabs[_tabController.index]["text"]
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
