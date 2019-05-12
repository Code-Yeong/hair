import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  TextEditingController phoneController, nameController, passwordController;
  String textPhone, textName, textPassword;
  Color _staffColor = Colors.green;
  Color _customerColor = Colors.blueAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isStaff = globalStore.state.loginState.role == Role.barber;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
                        '返回',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 230.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        border: Border.all(
                          color: _isStaff ? _staffColor : _customerColor,
                          width: 2.5,
                        ),
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
                                      decoration: new InputDecoration.collapsed(hintText: '输入手机号码'),
                                      style: new TextStyle(fontSize: 16.0, color: Colors.black),
                                      maxLines: 1,
                                      onChanged: (str) {
//                                        print("phone:$str");
                                        textPhone = str?.trim();
                                        setState(() {});
                                      },
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
                                Text('昵称', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                                SizedBox(width: 5.0),
                                Expanded(
                                  child: new Container(
                                    width: 100.0,
                                    child: new TextField(
                                      onSubmitted: null,
                                      decoration: new InputDecoration.collapsed(hintText: '输入昵称'),
                                      style: new TextStyle(fontSize: 16.0, color: Colors.black),
                                      maxLines: 1,
                                      onChanged: (str) {
//                                        print("name:$str");
                                        textName = str?.trim();
                                        setState(() {});
                                      },
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
                                      style: new TextStyle(fontSize: 16.0, color: Colors.black),
                                      maxLines: 1,
                                      onChanged: (str) {
//                                        print("password:$str");
                                        textPassword = str?.trim();
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
//                                  alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 40.0,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '会员',
                                    style: TextStyle(color: _isStaff ? Colors.black26 : _customerColor),
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                  child: Switch(
                                    activeColor: _staffColor,
                                    activeTrackColor: Colors.grey,
                                    inactiveThumbColor: _customerColor,
                                    inactiveTrackColor: Colors.grey,
                                    value: _isStaff,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isStaff = newValue;
                                        globalStore.dispatch(ChangeRoleAction(role: _isStaff ? Role.barber : Role.customer));
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '职工',
                                    style: TextStyle(
                                      color: _isStaff ? _staffColor : Colors.black26,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    BottomOneButton(
                      bgColor: _isStaff ? _staffColor : _customerColor,
                      colorDisabled: Colors.white.withOpacity(0.4),
                      bgColorDisabled: Colors.black26.withOpacity(0.2),
                      title: "注册",
                      disabled: _isDisabled(),
                      onTap: () {
                        globalStore.dispatch(new BeginSignupAction(
                          phone: textPhone,
                          name: textName,
                          password: textPassword,
                        ));
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

  bool _isDisabled() {
    if (textPhone == null || textPhone.length == 0) {
      return true;
    }
    if (textPassword == null || textPassword.length == 0) {
      return true;
    }

    if (textName == null || textName.length == 0) {
      return true;
    }
    return false;
  }
}
