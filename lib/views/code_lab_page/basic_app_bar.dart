import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BaseAppBarSample extends StatefulWidget {
  @override
  createState() => BaseAppBarSampleState();
}

class BaseAppBarSampleState extends State<BaseAppBarSample> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic AppBar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),
          IconButton(
            icon: Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (context) {
              return choices.skip(2).map((choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChoiceCard(choice: _selectedChoice),
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
