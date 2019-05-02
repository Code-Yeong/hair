import 'package:flutter/material.dart';
import 'package:hair/customer/menu_page.dart';
import 'package:hair/customer/reservation_page.dart';
import 'package:hair/customer/shop_list_page.dart';
import 'package:hair/customer/user_info_page.dart';
import 'package:hair/utils/common_colors.dart';

class CustomerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: TabBarView(children: <Widget>[
            Container(
              key: PageStorageKey("page1"),
              child: ShopListPage(),
            ),
            Container(
              key: PageStorageKey("page2"),
              child: MenuPage(),
            ),
            Container(
              height: 200.0,
              key: PageStorageKey("page3"),
              child: ReservationPage(),
//              child: TimelinePage(
//                title: "timeline",
//              ),
//              child: AndroidView(
//                viewType: 'BMapView',
//                onPlatformViewCreated: (value) {
//                  print("create :value:$value");
//                },
//              ),
            ),
            Container(
              key: PageStorageKey("page4"),
              child: UserInfoPage(),
            ),
          ]),
          backgroundColor: CommonColors.bgGray,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: CommonColors.lineDividing, width: 1.0),
              ),
            ),
            child: TabBar(
              unselectedLabelColor: Colors.grey.withOpacity(0.7),
              labelColor: Colors.grey,
              onTap: (index) {
                print("index:$index");
              },
              tabs: <Widget>[
                Tab(
                  text: '门店',
                  icon: Icon(
                    Icons.add_shopping_cart,
                  ),
                ),
                Tab(
                  text: '造型库',
                  icon: Icon(Icons.menu),
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
