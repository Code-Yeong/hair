import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/list_cell.dart';
import 'package:hair/customer/info/user_info_page_view_model.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/utils/common_colors.dart';

class StaffInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, UserInfoPageViewModel>(
          converter: (store) => UserInfoPageViewModel.fromStore(store),
          builder: (context, model) {
            return SafeArea(
              child: Container(
                color: CommonColors.bgGray,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blueGrey,
                      child: Text("个人中心", style: TextStyle(fontSize: 20.0, color: Colors.white)),
                      height: 54.0,
                    ),
                    Divider(height: 1.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: CommonColors.lineDividing, width: 1.0),
                        ),
                      ),
                      height: 150.0,
                      padding: EdgeInsets.only(left: 50.0, top: 10.0, bottom: 40.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/barber.jpg'),
                            radius: 30.0,
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  model?.barber?.name ?? '姓名',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(model?.barber?.sex == 0 ? '男' : '女'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
//                              globalStore.dispatch(BeginFetchCusInfoAction());
                              GlobalNavigator.shared.pushNamed(StaffRoute.staffVerifyPage);
                            },
                            child: ListCell(
                              title: "认证状态",
                              showDivider: true,
                              child: Text(
                                model?.barber?.status == null || model?.barber?.status == 1 ? '待审核' : (model?.barber?.status == 2 ? '已认证' : '去认证'),
                                style: TextStyle(color: model?.barber?.status != 2 ? Colors.red : Colors.green),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GlobalNavigator.shared.pushNamed(CustomerRoute.walletPage);
                            },
                            child: ListCell(
                              title: "我的钱包",
                              showDivider: true,
                              child: Text('${model?.barber?.money ?? 0}元'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ListCell(
                              title: "安全中心",
                              showDivider: true,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ListCell(
                              title: "隐私保护",
                              showDivider: true,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GlobalNavigator.shared.pop();
                            },
                            child: ListCell(
                              title: "退出登录",
                              showDivider: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
