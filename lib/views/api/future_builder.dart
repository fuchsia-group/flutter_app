import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/httpUtil.dart';

class FutureBuilderSample extends StatefulWidget {
  @override
  createState() => FutureBuilderSampleState();
}

class FutureBuilderSampleState extends State<FutureBuilderSample> {
  AsyncMemoizer _memoizer = AsyncMemoizer();

  _gerData() {
    return _memoizer.runOnce(() async {
      return await HttpUtil()
          .get('http://api.douban.com/v2/movie/top250', data: {'count': 15});
    });
  }

  Future _refreshData() async {
    setState(() {
      _memoizer = AsyncMemoizer();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder(
          builder: _buildFuture,
          future: _gerData(),
        ),
      ),
    );
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return Text('还没有开始网络请求');
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = snapshot.data['subjects'];
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, movies),
      itemCount: movies.length * 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, movies) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text(movies[index]['title']),
      leading: Text(movies[index]['year']),
      trailing: Text(movies[index]['original_title']),
    );
  }
}
