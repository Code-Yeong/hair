import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/component/one_button.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey,
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        GlobalNavigator.shared.pop();
                      },
                      child: Text(
                        '返回登录',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      padding: const EdgeInsets.all(24.0),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('手机', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                                SizedBox(width: 5.0),
                                Expanded(
                                  child: new Container(
                                    width: 100.0,
                                    child: new TextField(
                                      onSubmitted: null,
                                      decoration: new InputDecoration.collapsed(hintText: '输入账号'),
                                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('账号', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                                SizedBox(width: 5.0),
                                Expanded(
                                  child: new Container(
                                    width: 100.0,
                                    child: new TextField(
                                      onSubmitted: null,
                                      decoration: new InputDecoration.collapsed(hintText: '输入账号'),
                                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('密码', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                                SizedBox(width: 5.0),
                                Expanded(
                                  child: new Container(
                                    width: 100.0,
                                    height: 30.0,
                                    child: new TextField(
//                      controller: _textController,
                                      onSubmitted: null,
                                      decoration: new InputDecoration.collapsed(hintText: '输入密码'),
                                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    BottomOneButton(
                      title: "注册",
                      disabled: false,
                      onTap: () {
                        print("注册成功！");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
