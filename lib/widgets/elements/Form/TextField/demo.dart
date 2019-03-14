import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() {
    return TextFieldDemoState();
  }
}

class TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController _unameController = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _unameController.text = "hello world!";
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    // 监听文本变化
    _unameController.addListener(() {
      print(_unameController.text);
    });

    //监听焦点变化
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            controller: _unameController,
            focusNode: focusNode1,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
            onChanged: (v) {
              print("onChange: $v");
            },
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none),
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
