import 'package:flutter/material.dart';
import 'package:hair/staff/info/staff_info_page.dart';
import 'package:hair/staff/reservation/staff_reservation_page.dart';
import 'package:hair/staff/shop/staff_shop_page.dart';
import 'package:hair/utils/common_colors.dart';

class StaffHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(children: <Widget>[
            Container(
              height: 200.0,
              key: PageStorageKey("page0"),
              child: StaffShopPage(),
            ),
            Container(
              height: 200.0,
              key: PageStorageKey("page1"),
              child: StaffReservationPage(),
            ),
            Container(
              key: PageStorageKey("page2"),
              child: StaffInfoPage(),
            ),
          ]),
          backgroundColor: Colors.blueGrey,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: CommonColors.lineDividing, width: 1.0),
              ),
            ),
            child: TabBar(
              unselectedLabelColor: Colors.white70,
              labelColor: Colors.white,
              onTap: (index) {
                print("index:$index");
              },
              tabs: <Widget>[
                Tab(
                  text: '店铺',
                  icon: Icon(Icons.calendar_today),
                ),
                Tab(
                  text: '订单',
                  icon: Icon(Icons.calendar_today),
                ),
                Tab(
                  text: '我的',
                  icon: Icon(Icons.perm_identity),
                ),
              ],
            ),
          )),
    );
  }
}
