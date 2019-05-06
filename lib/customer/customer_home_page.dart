import 'package:flutter/material.dart';
import 'package:hair/customer/customer_main_tab.dart';
import 'package:hair/customer/info/user_info_page.dart';
import 'package:hair/customer/reservation_page.dart';
import 'package:hair/utils/common_colors.dart';

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(children: <Widget>[
            Container(
              key: PageStorageKey("page1"),
              child: CustomerMainTab(),
            ),
            Container(
              height: 200.0,
              key: PageStorageKey("page2"),
              child: ReservationPage(),
//              child: AndroidView(
//                viewType: 'BMapView',
//                onPlatformViewCreated: (value) {
//                  print("create :value:$value");
//                },
//              ),
            ),
            Container(
              key: PageStorageKey("page3"),
              child: UserInfoPage(),
            ),
          ]),
          backgroundColor: CommonColors.bgGray,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border(
                top: BorderSide(color: CommonColors.lineDividing, width: 1.0),
              ),
            ),
            child: TabBar(
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white30,
              labelColor: Colors.white,
              onTap: (index) {
                print("index:$index");
              },
              tabs: <Widget>[
                Tab(
                  text: '首页',
                  icon: Icon(
                    Icons.add_shopping_cart,
                  ),
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
