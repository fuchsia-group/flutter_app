import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  ExpansionTileDemoState createState() {
    return ExpansionTileDemoState();
  }
}

class ExpansionTileDemoState extends State<ExpansionTileDemo> {
  final List<Entry> data = <Entry>[
    new Entry(
      'Chapter A',
      <Entry>[
        new Entry(
          'Section A0',
          <Entry>[
            new Entry('Item A0.1'),
            new Entry('Item A0.2'),
            new Entry('Item A0.3'),
          ],
        ),
        new Entry('Section A1'),
        new Entry('Section A2'),
      ],
    ),
    new Entry(
      'Chapter B',
      <Entry>[
        new Entry('Section B0'),
        new Entry('Section B1'),
      ],
    ),
    new Entry(
      'Chapter C',
      <Entry>[
        new Entry('Section C0'),
        new Entry('Section C1'),
        new Entry(
          'Section C2',
          <Entry>[
            new Entry('Item C2.0'),
            new Entry('Item C2.1'),
            new Entry('Item C2.2'),
            new Entry('Item C2.3'),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _buildItem(data[index]),
      itemCount: data.length,
    );
  }

  Widget _buildItem(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey(root),
      title: Text(root.title),
      children: root.children.map(_buildItem).toList(),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}
