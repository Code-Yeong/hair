import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/component/list_cell.dart';
import 'package:hair/component/time_zone.dart';
import 'package:hair/component/toast.dart';
import 'package:hair/customer/info/user_info_page_view_model.dart';
import 'package:hair/model/customer.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class UserInfoDetailPage extends StatefulWidget {
  @override
  State createState() => UserInfoDetailPageState();
}

class UserInfoDetailPageState extends State<UserInfoDetailPage> {
  bool isEditable = false;
  String name;
  String nickName;
  String phone;
  String description;
  num sex;
  Customer cus;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          title: Text(
            "我的信息",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                if (isEditable) {
                  showDialog<Null>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text('提示'),
                        content: new SingleChildScrollView(
                          child: new Text(
                            '确定提交吗？',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('再改改'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          new FlatButton(
                            child: new Text(
                              '提交',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              setState(() {
                                isEditable = false;
                              });
                              Navigator.of(context).pop();
                              if (name == null || name.length == 0) {
                                showToast(text: '请输入正确的姓名');
                                return;
                              }
                              if (nickName == null || nickName.length == 0) {
                                showToast(text: '请输入正确的昵称');
                                return;
                              }
                              if (description == null || description.length == 0) {
                                showToast(text: '请输入正确的签名');
                                return;
                              }
                              if (phone == null || phone.length == 0 || !RegexUtil.isMobileExact(phone)) {
                                showToast(text: '请输入正确的手机号');
                                return;
                              }
                              Customer newCustomer = cus?.copyWith(name: name, nickName: nickName, phone: phone, description: description);
                              globalStore.dispatch(UpdateCusInfoAction(cus: newCustomer));
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                if (!isEditable) {
                  setState(() {
                    isEditable = true;
                  });
                }
              },
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 12.0, bottom: 16.0),
                child: Text(
                  isEditable ? '提交' : "修改",
                  style: TextStyle(fontSize: 16.0, color: Colors.red),
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: CommonColors.bgGray,
          child: StoreConnector<AppState, UserInfoPageViewModel>(
            onInit: (store) {},
            converter: (store) => UserInfoPageViewModel.fromStore(store),
            builder: (context, viewModel) {
              Role role = globalStore.state.loginState.role;
              if (role == Role.customer) {
                cus = viewModel.customer;
                return Container(
                  child: ListView(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "姓名",
                          showDivider: true,
                          child: isEditable
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  width: 150.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (v) {
                                      name = v.trim();
                                    },
                                  ),
                                )
                              : Text('${cus?.name}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "性别",
                          showDivider: true,
                          child: Text(cus?.gender == 0 ? "男" : "女"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "昵称",
                          showDivider: true,
                          child: isEditable
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  width: 150.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (v) {
                                      nickName = v.trim();
                                    },
                                  ),
                                )
                              : Text('${cus?.nickName}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "电话",
                          showDivider: true,
                          child: isEditable
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  width: 150.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (v) {
                                      phone = v.trim();
                                    },
                                  ),
                                )
                              : Text('${cus?.phone}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "账号状态",
                          showDivider: true,
                          child: Text('${accountStatusText[cus?.status ?? 0]}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "账号等级",
                          showDivider: true,
                          child: Text('Level ${cus?.level}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "积分",
                          showDivider: true,
                          child: Text('${cus?.score?.ceil()}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "个人描述",
                          showDivider: true,
                          child: isEditable
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  width: 280.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (v) {
                                      description = v.trim();
                                    },
                                  ),
                                )
                              : Text('${cus?.description}'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "上次登录",
                          showDivider: true,
                          child: Text('${cus?.lastLogin == null ? '' : DateTimeUtils.getDayFromStr(timeInMillSecondStr: cus?.lastLogin)}'),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (role == Role.barber) {
                return Container(
                  child: ListView(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "姓名",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "性别",
                          showDivider: true,
                          child: Text('男'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "昵称",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "电话",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "账号状态",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "账号等级",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "常用地址",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "积分",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "个人描述",
                          showDivider: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ListCell(
                          title: "上次登录",
                          showDivider: true,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
