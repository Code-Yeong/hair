import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/utils/common_colors.dart';

class UserAddressEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserAddressEditPageState();
}

class UserAddressEditPageState extends State<UserAddressEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text(
          "收货地址",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: CommonColors.bgGray,
        child: Column(children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('联系人',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextField(
//                      controller: _textController,
                        onSubmitted: null,
                        decoration:
                            new InputDecoration.collapsed(hintText: '姓名'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('电话',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextField(
//                      controller: _textController,
                        onSubmitted: null,
                        decoration:
                            new InputDecoration.collapsed(hintText: '手机号码'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('地址',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextField(
//                      controller: _textController,
                        onSubmitted: null,
                        decoration:
                            new InputDecoration.collapsed(hintText: '上门服务地址'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    width: 100.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: Text('补充说明',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: new Container(
                      width: 100.0,
                      child: new TextField(
//                      controller: _textController,
                        onSubmitted: null,
                        decoration:
                            new InputDecoration.collapsed(hintText: '备注'),
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 15.0,
              right: 20.0,
              left: 20.0,
            ),
            child: BottomOneButton(
              title: '确定',
              onTap: () {
                GlobalNavigator.shared.pop();
              },
            ),
          )
        ]),
      ),
    );
  }
}
