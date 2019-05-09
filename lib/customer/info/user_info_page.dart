import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/list_cell.dart';
import 'package:hair/customer/info/user_info_page_view_model.dart';
import 'package:hair/redux/app/app_state.dart';
import 'package:hair/redux/cus_info/cus_info_action.dart';
import 'package:hair/redux/store.dart';
import 'package:hair/utils/common_colors.dart';

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text(
          "个人中心",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
      ),
      body: StoreConnector<AppState, UserInfoPageViewModel>(
          converter: (store) => UserInfoPageViewModel.fromStore(store),
          builder: (context, model) {
            return Container(
              color: CommonColors.bgGray,
              child: Column(
                children: <Widget>[
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
                                model?.customer?.name ?? '姓名',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(model?.customer?.gender == 0 ? '男' : '女'),
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
                            globalStore.dispatch(BeginFetchCusInfoAction());
                            GlobalNavigator.shared.pushNamed(CustomerRoute.userAddressPage);
                          },
                          child: ListCell(
                            title: "地址管理",
                            showDivider: true,
                            child: Text('${model?.selectedAddress?.address ?? ''}', style: TextStyle(fontSize: 16.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
