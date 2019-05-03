import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/address_item_widget.dart';
import 'package:hair/component/one_button.dart';
import 'package:hair/utils/common_colors.dart';

class UserAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "我的地址",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData.fallback(),
        backgroundColor: CommonColors.bgGray,
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        color: CommonColors.bgGray,
        child: Column(children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: 2,
              itemBuilder: (context, index) {
                return AddressItemWidget(
                    username: '老王',
                    phone: '13344445555',
                    address: '北京市海淀区中关村技术交易大厦');
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.0,
                );
              },
            ),
          ),
          Container(
            height: 50.0,
            child: BottomOneButton(
              title: '新增地址',
              onTap: () {
                GlobalNavigator.shared
                    .pushNamed(CustomerRoute.userAddressEditPage);
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
