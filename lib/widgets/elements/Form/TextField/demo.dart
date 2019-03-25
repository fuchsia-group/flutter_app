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
      print("input ${_unameController.text}");
    });

    //监听焦点变化
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.blue.shade100, //设置填充色
                  filled: true, //是否填充
                  labelText: "LabelText",
                  hintText: "hintText",
                  helperText: "help",
                  errorText:
                      "error", //错误提示，同时设置errorText和helperText，显示errorText
                  hintStyle: TextStyle(color: Colors.green),
                  prefixIcon: Icon(Icons.image), //左侧图标
                  suffixText: "img", //右侧文字
                ),
                cursorWidth: 5.0,
                cursorColor: Colors.green,
                cursorRadius: Radius.circular(3),
              ),
              SizedBox(height: 10.0),
              // 圆角矩形
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      // borderSide: BorderSide(color: Colors.red,width: 3.0,style: BorderStyle.solid) //没效果
                    )),
              ),
              SizedBox(height: 10.0),
              // 圆角矩形-装饰线颜色
              Theme(
                data:
                    ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        // borderSide: BorderSide(color: Colors.red,width: 3.0,style: BorderStyle.solid) //没效果
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              // 圆角矩形-装饰线样式
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0)),
                child: TextFormField(
                  decoration: InputDecoration.collapsed(hintText: "textFormField"),
                ),
              ),

              SizedBox(height: 10.0),
              // 圆角矩形-装饰线样式
              TextField(
                decoration: InputDecoration(
                    labelText: "hello",
                    contentPadding: EdgeInsets.all(10.0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                        gapPadding: 10),
                    disabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder()),
              ),
              TextField(
                autofocus: true,
                controller: _unameController,
                focusNode: focusNode1,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
                onChanged: (v) {
                  // print("onChange: $v");
                },
                maxLength: 20,
              ),
              TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true, // 是否是密码
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
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 1.0))),
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
        ),
      ),
    );
  }
}
