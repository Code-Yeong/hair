import 'package:flutter/material.dart';
import 'package:hair/component/reservation_item_widget.dart';
import 'package:hair/customer/reservation_detail_page.dart';
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ReservationDetailPage(
                      title: 'Tome(天大店)',
                    );
                  }));
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
