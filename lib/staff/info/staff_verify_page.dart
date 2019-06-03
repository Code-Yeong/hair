import 'package:flutter/material.dart';
import 'package:hair/component/one_button.dart';

class StaffVerifyPage extends StatefulWidget {
  @override
  _StaffVerifyPageState createState() => _StaffVerifyPageState();
}

class _StaffVerifyPageState extends State<StaffVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('职业认证'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('1.真实姓名', style: TextStyle(fontSize: 18.0)),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: new TextField(
                  onSubmitted: null,
                  decoration: new InputDecoration.collapsed(
                    hintText: '请输入真实姓名',
                    border: OutlineInputBorder(),
                  ),
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                  maxLines: 1,
                  onChanged: (str) {
//                                        print("phone:$str");
//                    textPhone = str?.trim();
//                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('2.身份证号', style: TextStyle(fontSize: 18.0)),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: new TextField(
                  onSubmitted: null,
                  decoration: new InputDecoration.collapsed(
                    hintText: '请输入18位身份证号',
                    border: OutlineInputBorder(),
                  ),
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                  maxLines: 1,
                  onChanged: (str) {
//                                        print("phone:$str");
//                    textPhone = str?.trim();
//                    setState(() {});
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('3.职业证书', style: TextStyle(fontSize: 18.0)),
              ),
              Container(
                width: 160.0,
                height: 160.0,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 1.0),
                ),
                child: Image.asset('assets/images/plus.png'),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: BottomOneButton(
                  title: '提交',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
