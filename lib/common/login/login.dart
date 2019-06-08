import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/login/login_view_model.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/enum.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _phone;
  String _password;
  Color _staffColor = Colors.green;
  Color _customerColor = Colors.blueAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, LoginViewModel>(
            converter: (store) => LoginViewModel.fromStore(store),
            builder: (context, model) {
              bool _isStaff = globalStore.state.loginState.role == Role.barber;
              return Container(
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
                          padding: EdgeInsets.only(right: 20.0),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              GlobalNavigator.shared.pushNamed(MainRoute.signupPage);
                            },
                            child: Text(
                              '新用户注册',
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
                            height: 180.0,
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
                                            onChanged: (phone) {
                                              _phone = phone;
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
                                            obscureText: true,
                                            onSubmitted: null,
                                            decoration: new InputDecoration.collapsed(hintText: '输入密码'),
                                            style: new TextStyle(fontSize: 16.0, color: Colors.black),
                                            maxLines: 1,
                                            onChanged: (password) {
                                              _password = password;
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
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 12.0),
                          BottomOneButton(
                            bgColor: _isStaff ? _staffColor : _customerColor,
                            title: "登录",
                            disabled: false,
                            onTap: () async {
                              globalStore.dispatch(new BeginLoginAction(phone: _phone, password: _password));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
