import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/login/login_view_model.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/login/login_action.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StoreConnector<AppState, LoginViewModel>(
            converter: (store) => LoginViewModel.fromStore(store),
            builder: (context, model) {
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
                              GlobalNavigator.shared.pushNamed(CustomerRoute.signupPage);
                            },
                            child: Text(
                              '新会员注册',
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
                            height: 130.0,
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
                                      Text('账号', style: TextStyle(fontSize: 18.0, color: Colors.black)),
                                      SizedBox(width: 5.0),
                                      Expanded(
                                        child: new Container(
                                          width: 100.0,
                                          child: new TextField(
//                      controller: _textController,
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
                            title: "会员登录",
                            disabled: false,
                            onTap: () {
                              var store = StoreProvider.of<AppState>(context);
                              store.dispatch(new BeginLoginAction());
//                  store.state.globalNavigator.pushNamed(CustomerRoute.customerHomePage);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//                    return CustomerHomePage();
//                  }));
                            },
                          ),
                          SizedBox(height: 12.0),
                          BottomOneButton(
                            title: "员工登录",
                            disabled: false,
                            onTap: () {
                              GlobalNavigator.shared.pushNamed(StaffRoute.staffHomePage);
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
