import 'package:flutter/material.dart';
import 'package:hair/common/global_navigator.dart';
import 'package:hair/common/regist_route.dart';
import 'package:hair/component/reservation_item_widget.dart';
import 'package:hair/utils/common_colors.dart';
import 'package:hair/utils/enum.dart';

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "我的订单",
            style: TextStyle(color: Colors.black),
          ),
//          iconTheme: IconThemeData.fallback(),
          backgroundColor: CommonColors.bgGray,
          elevation: 1.0,
        ),
        body: Container(
          padding: EdgeInsets.all(12.0),
          color: CommonColors.bgGray,
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ReservationItemWidget(
                avatar: 'assets/images/barber.jpg',
                shopName: '天大店',
                staffName: 'Tom',
                status: OrderStatus.commenting,
                serviceType: '理发',
                createTime: '2019年5月2日 10:00-12:00',
                money: 35,
                onTap: () {
                  GlobalNavigator.shared.pushNamed(CustomerRoute.chooseReservationTimePage);
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
