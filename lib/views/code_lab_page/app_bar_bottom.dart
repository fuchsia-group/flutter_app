import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppBarBottomSample extends StatefulWidget {
  @override
  createState() => AppBarBottomSampleState();
}

class AppBarBottomSampleState extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar Bottom Widget"),
        leading: IconButton(
          tooltip: "Previous choice",
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _nextPage(-1);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: "Next choice",
            onPressed: () {
              _nextPage(1);
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.green),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: TabPageSelector(controller: _tabController,selectedColor: Colors.red),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ChoiceCard(choice: choice),
          );
        }).toList(),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: "CAR", icon: Icons.directions_car),
  const Choice(title: "BICYCLE", icon: Icons.directions_bike),
  const Choice(title: "BOAT", icon: Icons.directions_boat),
  const Choice(title: "BUS", icon: Icons.directions_bus),
  const Choice(title: "TRAIN", icon: Icons.directions_railway),
  const Choice(title: "WALK", icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle)
          ],
        ),
      ),
    );
  }
}
