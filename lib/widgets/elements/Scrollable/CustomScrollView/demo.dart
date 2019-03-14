import 'package:flutter/material.dart';

class CustomScrollViewDemo extends StatefulWidget {
  @override
  CustomScrollViewDemoState createState() {
    return CustomScrollViewDemoState();
  }
}

class CustomScrollViewDemoState extends State<CustomScrollViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Demo"),
              background: Container(
                color: Colors.blue,
              ),
              collapseMode: CollapseMode.parallax,
            ),
           
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("grid item $index"),
                  );
                }, childCount: 20)),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("list item $index"),
              );
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
