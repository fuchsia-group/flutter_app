import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const String _name = "佐助";
const String _m_name = "鸣人";
// const String _name = "Your Name";

final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<StatelessWidget> _messages = <StatelessWidget>[];
  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendlychat"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200]))),
      ),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textEditingController,
              onChanged: (text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: _isComposing
                  ? () => _handleSubmitted(_textEditingController.text)
                  : null,
            ),
          )
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
          duration: Duration(microseconds: 700), vsync: this),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class SelfChatMessage extends StatelessWidget {
  SelfChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(text),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  child: Text(_name[0]),
                ),
              )
            ],
          ),
        ));
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  child: Text(_m_name[0]),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_m_name, style: Theme.of(context).textTheme.subhead),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(text),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
