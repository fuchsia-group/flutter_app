import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewDemo extends StatefulWidget {
  @override
  ListViewDemoState createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  static const loadingTag = "##loading##";

  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Column(
      children: <Widget>[
        ListTile(title: Text("列表"), subtitle: Text("123")),
        Expanded(
          child: ListView.separated(
              itemCount: _words.length,
              itemBuilder: (context, index) {
                if (_words[index] == loadingTag) {
                  if (_words.length - 1 < 100) {
                    _retrieveData();
                    return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: Container (
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 15.0,
                                height: 15.0,
                                child: CircularProgressIndicator(strokeWidth: 2.0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("正在加载")
                            ],
                          ),
                        ));
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                }
                return ListTile(title: Text("${_words[index]} $index"));
              },
              separatorBuilder: (context, index) {
                return index % 2 == 0 ? divider1 : divider2;
              }),
        )
      ],
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
