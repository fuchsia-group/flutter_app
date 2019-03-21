import 'package:flutter/material.dart';

class ViewPageExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "new pages",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
          appBar: AppBar(title: Text("viewPage"), 
          actions: <Widget>[IconButton(icon: Icon(Icons.add_alarm, color: Colors.grey), onPressed: (){},)],),
          body: DisplayPage(),
      ),
    );
  }
}

class DisplayPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DisplayPageState();
  
}

class _DisplayPageState extends State<DisplayPage> {
  final images = [
'images/test1.jpg', 
'images/test2.jpg', 
'images/test3.jpg',
];
  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox.fromSize(
        size: Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext cotext, int position){
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(18.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8.0),
                     child:  Image.asset(
                      images[position],
                      fit: BoxFit.cover,
                    ),
                   )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}